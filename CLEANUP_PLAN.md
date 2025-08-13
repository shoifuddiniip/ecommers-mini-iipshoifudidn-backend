# Rencana Clean Code Backend E-Commerce

## Tujuan
Membuat kode lebih rapi, mudah dibaca, mudah di-maintain, dan scalable.

## Checklist Clean Code

### 1. Struktur Project
- [ ] Pisahkan layer: controller, model, config, middleware, db, util/helper
- [ ] Pastikan penamaan file dan folder konsisten

### 2. Penamaan
- [ ] Gunakan penamaan variabel, fungsi, dan file yang deskriptif dan konsisten (Bahasa Inggris)
- [ ] Hindari singkatan yang tidak umum

### 3. Fungsi & Modularisasi
- [ ] Pecah fungsi yang terlalu panjang/kompleks
- [ ] Hindari duplikasi kode
- [ ] Gunakan helper/util jika ada logic yang berulang

### 4. Error Handling
- [ ] Pastikan error handling konsisten dan informatif
- [ ] Hindari panic kecuali benar-benar fatal

### 5. Komentar & Dokumentasi
- [ ] Tambahkan komentar pada bagian yang butuh penjelasan
- [ ] Tambahkan docstring pada fungsi penting

### 6. Dependency Injection
- [ ] Pastikan dependency (seperti DB) di-inject dengan benar, tidak hardcode

### 7. Validasi Input
- [ ] Validasi semua input dari user (body, query, params)

### 8. Response API
- [ ] Standarisasi response (success/error)
- [ ] Gunakan status code HTTP yang tepat

### 9. SQL & DB
- [ ] Gunakan query yang aman (hindari SQL injection)
- [ ] Pastikan semua kolom di SELECT sesuai kebutuhan struct

### 10. Testing
- [ ] Tambahkan unit test minimal untuk model & controller utama

---

Checklist ini akan digunakan sebagai panduan sebelum refactor/clean code.
