package middleware

import (
	"backend/config"
	"backend/model"
	"net/http"
	"strings"

	"github.com/dgrijalva/jwt-go"
)

var defaultPublic = map[string]struct {
}{

	"/login":    {},
	"/products": {},
}

// isPublicEndpoint menentukan apakah path adalah endpoint publik
func isPublicEndpoint(path string) bool {
	_, ok := defaultPublic[path]
	return ok
}

func AuthMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if isPublicEndpoint(r.URL.Path) {
			next.ServeHTTP(w, r)
			return
		}
		authHeader := r.Header.Get("Authorization")
		if authHeader == "" || !strings.HasPrefix(authHeader, "Bearer ") {
			http.Error(w, "Unauthorized", http.StatusUnauthorized)
			return
		}
		tokenString := strings.TrimPrefix(authHeader, "Bearer ")
		claims := &model.Claims{}
		secret := config.GetJWTSecret()
		token, err := jwt.ParseWithClaims(tokenString, claims, func(token *jwt.Token) (interface{}, error) {
			return []byte(secret), nil
		})
		if err != nil || !token.Valid {
			http.Error(w, "Unauthorized", http.StatusUnauthorized)
			return
		}
		next.ServeHTTP(w, r)
	})
}
