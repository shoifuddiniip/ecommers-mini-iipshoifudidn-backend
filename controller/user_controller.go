package controller

import (
	"backend/config"
	"backend/model"
	"encoding/json"
	"net/http"
)

func Login(w http.ResponseWriter, r *http.Request) {
	username, password, ok := r.BasicAuth()
	if !ok {
		w.Header().Set("WWW-Authenticate", `Basic realm="Restricted"`)
		w.WriteHeader(http.StatusUnauthorized)
		return
	}

	if !model.ValidateUser(username, password) {
		w.WriteHeader(http.StatusUnauthorized)
		return
	}

	secret := config.GetJWTSecret()
	token, err := model.GenerateJWT(username, secret)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(map[string]string{"token": token})
}
