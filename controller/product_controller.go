package controller

import (
	"net/http"
)

func GetProducts(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	w.Write([]byte(`[{"id":1,"name":"Produk Contoh","price":10000}]`))
}
