package main

import (
	"backend/config"
	"backend/middleware"
	"backend/model"
	"log"
	"net/http"
	"os"

	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
	"github.com/joho/godotenv"
)

var db *sqlx.DB

// ================== CONFIG ==================

// Middleware tetap bisa dipindah ke file terpisah jika diinginkan

// ================== MIDDLEWARE ==================
func middlewareLogger(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		log.Printf("[HIT] %s %s %s", r.Method, r.URL.Path, r.RemoteAddr)
		next.ServeHTTP(w, r)
	})
}

func middlewareCORS(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		origin := r.Header.Get("Origin")
		if origin != "" {
			w.Header().Set("Access-Control-Allow-Origin", origin)
		}
		w.Header().Set("Vary", "Origin")
		w.Header().Set("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS")
		w.Header().Set("Access-Control-Allow-Headers", "Content-Type, Authorization")
		w.Header().Set("Access-Control-Allow-Credentials", "true")
		if r.Method == http.MethodOptions {
			w.WriteHeader(http.StatusOK)
			return
		}
		next.ServeHTTP(w, r)
	})
}

// ================== MAIN ==================
func main() {
	_ = godotenv.Load(".env")
	backendPort := os.Getenv("BACKEND_PORT")
	if backendPort == "" {
		backendPort = "8000"
	}
	frontendPort := os.Getenv("FRONTEND_PORT")
	if frontendPort == "" {
		frontendPort = "3000"
	}

	db = config.InitDB()
	defer db.Close()
	model.SetDB(db)

	r := NewRouter()

	r.Use(middlewareLogger)
	r.Use(middlewareCORS)

	// Subrouter untuk endpoint user (protected)
	userRouter := r.PathPrefix("/orders").Subrouter()
	userRouter.Use(middleware.AuthMiddleware)
	userRouter.HandleFunc("", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		w.Write([]byte(`[{"id":1,"item":"Order Contoh"}]`))
	}).Methods("GET")

	// Jalankan backend di port dari env
	go func() {
		log.Printf("Backend server running on :%s", backendPort)
		log.Fatal(http.ListenAndServe(":"+backendPort, r))
	}()

	// Jalankan static file server untuk frontend di port dari env
	fs := http.FileServer(http.Dir("frontend"))
	http.Handle("/", fs)
	log.Printf("Frontend static server running on :%s (folder ./frontend)", frontendPort)
	log.Fatal(http.ListenAndServe(":"+frontendPort, nil))
}
