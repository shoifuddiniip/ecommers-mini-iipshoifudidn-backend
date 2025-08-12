package model

import (
	"crypto/sha512"
	"encoding/hex"
	"time"

	"github.com/dgrijalva/jwt-go"
	"github.com/jmoiron/sqlx"
)

// GetUserIdAndFullname mengambil id dan fullname user dari database berdasarkan username
func GetUserIdAndFullname(username string, userId *int, fullname *string) error {
	return db.QueryRowx("SELECT id, fullname FROM users WHERE username=?", username).Scan(userId, fullname)
}

var db *sqlx.DB

type Claims struct {
	Username string `json:"username"`
	Fullname string `json:"fullname"`

	jwt.StandardClaims
}

func SetDB(database *sqlx.DB) {
	db = database
}

func hashPassword(password string) string {
	h := sha512.New()
	h.Write([]byte(password))
	return hex.EncodeToString(h.Sum(nil))
}

func ValidateUser(username, password string) bool {
	var storedPassword string
	err := db.Get(&storedPassword, "SELECT password FROM users WHERE username=?", username)
	if err != nil {
		return false
	}
	return storedPassword == hashPassword(password)
}

func GenerateJWT(username string, secret string) (string, error) {
	// Ambil fullname dari database
	var fullname string
	err := db.Get(&fullname, "SELECT fullname FROM users WHERE username=?", username)
	if err != nil {
		fullname = ""
	}
	expirationTime := time.Now().Add(24 * time.Hour)
	claims := &Claims{
		Username: username,
		Fullname: fullname,
		StandardClaims: jwt.StandardClaims{
			ExpiresAt: expirationTime.Unix(),
		},
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	return token.SignedString([]byte(secret))
}
