package model

import (
	"database/sql"
	"fmt"
	"time"
)

// OrderRequest didefinisikan di model agar tidak circular import
type OrderRequest struct {
	UserID      string      `json:"userId"`
	Items       []OrderItem `json:"items"`
	Subtotal    float32     `json:"subtotal"`
	Discount    float32     `json:"discount"`
	DeliveryFee float32     `json:"deliveryFee"`
	Total       float32     `json:"total"`
	PromoCode   *string     `json:"promoCode"`
}

type OrderItem struct {
	ProductID int     `json:"productId" db:"product_id"`
	Name      string  `json:"name" db:"name"`
	Qty       int     `json:"qty" db:"qty"`
	Price     float32 `json:"price" db:"price"`
	Size      string  `json:"size" db:"size"`
	Color     string  `json:"color" db:"color"`
}

type Order struct {
	OrderID     string      `json:"orderId" db:"order_id"`
	UserID      int         `json:"userId" db:"user_id"`
	Items       []OrderItem `json:"items"`
	Subtotal    float32     `json:"subtotal" db:"subtotal"`
	Discount    float32     `json:"discount" db:"discount"`
	DeliveryFee float32     `json:"deliveryFee" db:"delivery_fee"`
	Total       float32     `json:"total" db:"total"`
	PromoCode   *string     `json:"promoCode" db:"promo_code"`
	Status      string      `json:"status" db:"status"`
	PaymentCode string      `json:"paymentCode" db:"payment_code"`
}

func CreateOrder(userId int, req OrderRequest) (string, error) {
	orderId := fmt.Sprintf("ORDER%d%d", userId, time.Now().UnixNano())
	status := "pending"
	paymentCode := orderId
	_, err := db.Exec(`INSERT INTO orders (order_id, user_id, subtotal, discount, delivery_fee, total, promo_code, status, payment_code) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
		orderId, userId, req.Subtotal, req.Discount, req.DeliveryFee, req.Total, req.PromoCode, status, paymentCode)
	if err != nil {
		return "", err
	}
	for _, item := range req.Items {
		_, err := db.Exec(`INSERT INTO order_items (order_id, product_id, name, qty, price, size, color) VALUES (?, ?, ?, ?, ?, ?, ?)`,
			orderId, item.ProductID, item.Name, item.Qty, item.Price, item.Size, item.Color)
		if err != nil {
			return "", err
		}
	}
	// Soft delete cart user setelah order selesai
	var cartID int
	err = db.Get(&cartID, "SELECT id FROM carts WHERE user_id=? AND deleted_at IS NULL", userId)
	if err == nil {
		_, _ = db.Exec("UPDATE cart_items SET deleted_at=NOW() WHERE cart_id=? AND deleted_at IS NULL", cartID)
		_, _ = db.Exec("UPDATE carts SET deleted_at=NOW() WHERE id=? AND deleted_at IS NULL", cartID)
	}
	return orderId, nil
}

func GetOrder(orderId string) (*Order, error) {
	var order Order
	err := db.Get(&order, `SELECT * FROM orders WHERE order_id = ?`, orderId)
	if err != nil {
		return nil, err
	}
	var items []OrderItem
	err = db.Select(&items, `SELECT product_id, name, qty, price, size, color FROM order_items WHERE order_id = ?`, orderId)
	if err != nil && err != sql.ErrNoRows {
		return nil, err
	}
	order.Items = items
	return &order, nil
}

func ConfirmPayment(orderId, paymentCode string) (bool, error) {
	res, err := db.Exec(`UPDATE orders SET status = 'paid' WHERE order_id = ? AND payment_code = ?`, orderId, paymentCode)
	if err != nil {
		return false, err
	}
	affected, _ := res.RowsAffected()
	return affected > 0, nil
}
