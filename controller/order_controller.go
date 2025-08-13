package controller

import (
	"backend/model"
	"encoding/json"
	"net/http"
	"strconv"
)

type OrderItem struct {
	ProductID int     `json:"productId"`
	Name      string  `json:"name"`
	Qty       int     `json:"qty"`
	Price     float32 `json:"price"`
	Size      string  `json:"size"`
	Color     string  `json:"color"`
}

// Gunakan model.OrderRequest, tidak perlu didefinisikan ulang di controller

type OrderResponse struct {
	OrderID     string `json:"orderId"`
	PaymentCode string `json:"paymentCode"`
	Status      string `json:"status"`
}

type PaymentConfirmRequest struct {
	OrderID     string `json:"orderId"`
	PaymentCode string `json:"paymentCode"`
}

type PaymentConfirmResponse struct {
	Success bool   `json:"success"`
	Status  string `json:"status"`
}

func CreateOrder(w http.ResponseWriter, r *http.Request) {
	var req model.OrderRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, "Invalid request", http.StatusBadRequest)
		return
	}
	uid, err := strconv.Atoi(req.UserID)
	if err != nil {
		http.Error(w, "userId must be integer", http.StatusBadRequest)
		return
	}
	orderId, err := model.CreateOrder(uid, req)
	if err != nil {
		http.Error(w, "Gagal membuat order", http.StatusInternalServerError)
		return
	}
	resp := OrderResponse{
		OrderID:     orderId,
		PaymentCode: orderId,
		Status:      "pending",
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(resp)
}

func GetOrder(w http.ResponseWriter, r *http.Request) {
	orderId := r.URL.Path[len("/orders/"):]
	order, err := model.GetOrder(orderId)
	if err != nil {
		http.Error(w, "Order not found", http.StatusNotFound)
		return
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(order)
}

func ConfirmPayment(w http.ResponseWriter, r *http.Request) {
	var req PaymentConfirmRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, "Invalid request", http.StatusBadRequest)
		return
	}
	success, err := model.ConfirmPayment(req.OrderID, req.PaymentCode)
	if err != nil {
		http.Error(w, "Gagal konfirmasi pembayaran", http.StatusInternalServerError)
		return
	}
	resp := PaymentConfirmResponse{
		Success: success,
		Status:  "paid",
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(resp)
}
