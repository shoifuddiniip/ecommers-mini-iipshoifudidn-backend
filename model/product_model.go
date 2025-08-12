package model

// db diambil dari user_model.go

type Product struct {
	ID            int      `db:"id" json:"id"`
	Name          string   `db:"name" json:"name"`
	Price         float32  `db:"price" json:"price"`
	Image         string   `db:"image" json:"image"`
	Category      string   `db:"category" json:"category"`
	Color         string   `db:"color" json:"color"`
	Size          string   `db:"size" json:"size"`
	OriginalPrice *float32 `db:"original_price" json:"originalPrice,omitempty"`
	Stock         int      `db:"stock" json:"stock"`
}

func GetAllProducts() ([]Product, error) {
	var products []Product
	err := db.Select(&products, `SELECT id, name, price, image, category, color, size, original_price, stock FROM products`)
	return products, err
}

func GetProductsBySearch(search string) ([]Product, error) {
	var products []Product
	query := `SELECT id, name, price, image, category, color, size, original_price, stock FROM products WHERE name LIKE ?`
	like := "%" + search + "%"
	err := db.Select(&products, query, like)
	return products, err
}
