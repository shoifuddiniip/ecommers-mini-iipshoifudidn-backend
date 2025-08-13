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
	r.HandleFunc("/orders", controller.GetOrdersByUser).Methods(http.MethodGet, http.MethodOptions)
	r.HandleFunc("/orders", controller.CreateOrder).Methods(http.MethodPost, http.MethodOptions)
	// r.HandleFunc("/orders/{orderId}", controller.GetOrder).Methods(http.MethodGet, http.MethodOptions) // Not implemented
	r.HandleFunc("/payments/confirm", controller.ConfirmPayment).Methods(http.MethodPost, http.MethodOptions)
	// Endpoint download file
	r.HandleFunc("/files/{filename:.*}", controller.DownloadFile).Methods(http.MethodGet)
	// Endpoint cart (DB)
	r.HandleFunc("/cart", controller.GetCart).Methods(http.MethodGet, http.MethodOptions)
	r.HandleFunc("/cart", controller.UpdateCart).Methods(http.MethodPut, http.MethodOptions)

	return r
}
