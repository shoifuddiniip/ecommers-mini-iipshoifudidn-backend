package model

import (
	"database/sql"
)

type CartItem struct {
	ID        int     `db:"id" json:"id"`
	Name      string  `db:"name" json:"name"`
	Price     float32 `db:"price" json:"price"`
	Image     string  `db:"image" json:"image"`
	Size      string  `db:"size" json:"size"`
	Color     string  `db:"color" json:"color"`
	Qty       int     `db:"qty" json:"qty"`
	ProductID int     `db:"product_id" json:"productId"`
}

type Cart struct {
	ID     int        `db:"id" json:"id"`
	UserID int        `db:"user_id" json:"userId"`
	Items  []CartItem `json:"items"`
}

// Get cart by user id
func GetCartByUserID(userID int) ([]CartItem, error) {
	var cartID int
	err := db.Get(&cartID, "SELECT id FROM carts WHERE user_id=? AND deleted_at IS NULL", userID)
	if err == sql.ErrNoRows {
		return []CartItem{}, nil
	} else if err != nil {
		return nil, err
	}
	var items []CartItem
	err = db.Select(&items, "SELECT id, product_id, name, price, image, size, color, qty FROM cart_items WHERE cart_id=? AND deleted_at IS NULL", cartID)
	return items, err
}

// Update/replace cart for user
func UpdateCartForUser(userID int, items []CartItem) error {
	tx, err := db.Beginx()
	if err != nil {
		return err
	}
	defer tx.Rollback()
	var cartID int
	err = tx.Get(&cartID, "SELECT id FROM carts WHERE user_id=? AND deleted_at IS NULL", userID)
	if err == sql.ErrNoRows {
		res, err := tx.Exec("INSERT INTO carts (user_id) VALUES (?)", userID)
		if err != nil {
			return err
		}
		lastID, _ := res.LastInsertId()
		cartID = int(lastID)
	} else if err != nil {
		return err
	}
	_, err = tx.Exec("UPDATE cart_items SET deleted_at=NOW() WHERE cart_id=? AND deleted_at IS NULL", cartID)
	if err != nil {
		return err
	}
	for _, item := range items {
		_, err := tx.Exec(`INSERT INTO cart_items (cart_id, product_id, name, price, image, size, color, qty) VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
			cartID, item.ProductID, item.Name, item.Price, item.Image, item.Size, item.Color, item.Qty)
		if err != nil {
			return err
		}
	}
	return tx.Commit()
}
