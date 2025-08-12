package controller

import (
	"backend/model"
	"encoding/json"
	"net/http"
	"strconv"
)

type CartItem struct {
	ID        string  `json:"id"`
	Name      string  `json:"name"`
	Price     float32 `json:"price"`
	Image     string  `json:"image"`
	Size      string  `json:"size"`
	Color     string  `json:"color"`
	Qty       int     `json:"qty"`
	ProductID int     `json:"productId"`
}

type CartRequest struct {
	UserID string     `json:"userId"`
	Items  []CartItem `json:"items"`
}

// Dummy in-memory cart (for demo, replace with DB in production)
var userCarts = make(map[string][]CartItem)

func GetCart(w http.ResponseWriter, r *http.Request) {
	userId := r.URL.Query().Get("userId")
	if userId == "" {
		http.Error(w, "userId required", http.StatusBadRequest)
		return
	}
	uid, err := strconv.Atoi(userId)
	if err != nil {
		http.Error(w, "userId must be integer", http.StatusBadRequest)
		return
	}
	items, err := model.GetCartByUserID(uid)
	if err != nil {
		http.Error(w, "Gagal mengambil cart", http.StatusInternalServerError)
		return
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(items)
}

func UpdateCart(w http.ResponseWriter, r *http.Request) {
	var req CartRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, "Invalid request", http.StatusBadRequest)
		return
	}
	if req.UserID == "" {
		http.Error(w, "userId required", http.StatusBadRequest)
		return
	}
	uid, err := strconv.Atoi(req.UserID)
	if err != nil {
		http.Error(w, "userId must be integer", http.StatusBadRequest)
		return
	}
	// Konversi []CartItem ke []model.CartItem
	var items []model.CartItem
	for _, it := range req.Items {
		items = append(items, model.CartItem{
			Name:      it.Name,
			Price:     it.Price,
			Image:     it.Image,
			Size:      it.Size,
			Color:     it.Color,
			Qty:       it.Qty,
			ProductID: it.ProductID,
		})
	}
	err = model.UpdateCartForUser(uid, items)
	if err != nil {
		http.Error(w, "Gagal update cart", http.StatusInternalServerError)
		return
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(map[string]string{"status": "ok"})
}
