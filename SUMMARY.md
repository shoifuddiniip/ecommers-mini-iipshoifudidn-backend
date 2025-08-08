# Backend System Summary

## Struktur Folder
- `main.go` — Entry point, inisialisasi DB, setup router, dan middleware global (CORS, logger, Auth).
- `router.go` — Definisi semua endpoint (publik dan user).
- `controller/` — Handler untuk endpoint (misal: `user_controller.go`, `product_controller.go`).
- `model/` — Model dan fungsi DB (misal: validasi user, generate JWT).
- `middleware/` — Middleware khusus, seperti `AuthMiddleware` (validasi JWT).
- `config/` — Konfigurasi DB, load dari `.env`.

## Middleware
- **CORS** dan **logger**: Diaktifkan global di `main.go`.
- **AuthMiddleware**: Diaktifkan global di `main.go`, namun otomatis skip endpoint publik (`/login`, `/products`) lewat pengecualian di dalam fungsi.

## Endpoint
- **Publik**: 
  - `POST /login` — Login, return JWT.
  - `GET /products` — List produk.
- **User (protected/JWT)**:
  - `GET /orders` — Hanya bisa diakses jika login (JWT valid).

## Autentikasi
- JWT dikirim via header `Authorization: Bearer <token>`.
- Endpoint publik tidak butuh token, endpoint lain wajib token.

## Konfigurasi
- Koneksi DB diatur lewat file `.env` dan dibaca oleh `config/db.go`.

## Best Practice
- Struktur modular, mudah dikembangkan.
- Middleware dan pengecualian endpoint publik sudah otomatis.
- Mudah menambah endpoint baru, baik publik maupun protected.

---

Untuk menambah fitur, cukup tambahkan endpoint di `router.go` dan handler di `controller/`.
