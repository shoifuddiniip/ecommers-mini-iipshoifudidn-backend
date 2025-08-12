package controller

import (
	"backend/model"
	"encoding/json"
	"net/http"
)

func GetProducts(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	search := r.URL.Query().Get("search")
	var products []model.Product
	var err error
	if search != "" {
		products, err = model.GetProductsBySearch(search)
	} else {
		products, err = model.GetAllProducts()
	}
	if err != nil {
		http.Error(w, "Gagal mengambil data produk", http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(products)
}
