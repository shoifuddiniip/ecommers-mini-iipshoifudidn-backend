package main

import (
	"backend/controller"
	"net/http"

	"github.com/gorilla/mux"
)

func NewRouter() *mux.Router {
	r := mux.NewRouter()

	r.HandleFunc("/products", controller.GetProducts).Methods(http.MethodGet, http.MethodOptions)
	r.HandleFunc("/login", controller.Login).Methods(http.MethodPost, http.MethodOptions)
	r.HandleFunc("/orders", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		w.Write([]byte(`[{"id":1,"item":"Order Contoh"}]`))
	}).Methods("GET")
	// Endpoint download file
	r.HandleFunc("/files/{filename:.*}", controller.DownloadFile).Methods(http.MethodGet)

	return r
}
