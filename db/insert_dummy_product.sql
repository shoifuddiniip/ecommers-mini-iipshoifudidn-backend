ALTER TABLE products ADD COLUMN IF NOT EXISTS category VARCHAR(50) NOT NULL DEFAULT '';
-- ALTER TABLE untuk menambah kolom stock jika belum ada
ALTER TABLE products ADD COLUMN IF NOT EXISTS stock INT NOT NULL DEFAULT 0;
INSERT INTO products (id, name, price, image, category, color, size, original_price, stock)
VALUES
  (1, 'Gradient Graphic T-Shirt', 180, 'https://via.placeholder.com/300x300?text=Shirt+1', 'T-Shirts', 'Red', 'M', NULL, 100),
  (2, 'Polo with Tipping Details', 150, 'https://via.placeholder.com/300x300?text=Shirt+2', 'T-Shirts', 'Blue', 'L', NULL, 100),
  (3, 'Black Striped T-Shirt', 130, 'https://via.placeholder.com/300x300?text=Shirt+3', 'T-Shirts', 'Black', 'S', NULL, 100),
  (4, 'Skinny Fit Jeans', 240, 'https://via.placeholder.com/300x300?text=Jeans+1', 'Jeans', 'Blue', 'M', 260, 100),
  (5, 'Checkered Shirt', 180, 'https://via.placeholder.com/300x300?text=Shirt+4', 'Shirts', 'Red', 'L', NULL, 100),
  (6, 'Sleeve Striped T-Shirt', 150, 'https://via.placeholder.com/300x300?text=Shirt+5', 'T-Shirts', 'Orange', 'M', 180, 100),
  (7, 'Vertical Striped Shirt', 212, 'https://via.placeholder.com/300x300?text=Shirt+6', 'Shirts', 'Green', 'XL', 232, 100),
  (8, 'Orange Graphic T-Shirt', 145, 'https://via.placeholder.com/300x300?text=Shirt+7', 'T-Shirts', 'Orange', 'S', NULL, 100),
  (9, 'Loose Fit Bermuda Shorts', 80, 'https://via.placeholder.com/300x300?text=Shorts+1', 'Shorts', 'Blue', 'M', NULL, 100);

ALTER TABLE products ADD COLUMN IF NOT EXISTS image VARCHAR(255);
ALTER TABLE products ADD COLUMN IF NOT EXISTS color VARCHAR(50);
ALTER TABLE products ADD COLUMN IF NOT EXISTS size VARCHAR(10);
ALTER TABLE products ADD COLUMN IF NOT EXISTS original_price INT;
