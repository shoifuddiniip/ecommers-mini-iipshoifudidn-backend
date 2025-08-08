package config

import (
	"fmt"
	"log"
	"os"

	"github.com/jmoiron/sqlx"
	"github.com/joho/godotenv"
)

func InitDB() *sqlx.DB {
	dbConfig, err := LoadDBConfig()
	if err != nil {
		log.Fatalln("Failed to load DB config:", err)
	}
	dsn := dbConfig.DSN()
	conn, err := sqlx.Connect("mysql", dsn)
	if err != nil {
		log.Fatalln("Database connection failed:", err)
	}
	return conn
}

type DBConfig struct {
	Host     string
	Port     string
	Name     string
	Username string
	Password string
}

func LoadDBConfig() (*DBConfig, error) {
	_ = godotenv.Load(".env") // load .env file
	cfg := &DBConfig{
		Host:     os.Getenv("DB_HOST"),
		Port:     os.Getenv("DB_PORT"),
		Name:     os.Getenv("DB_NAME"),
		Username: os.Getenv("DB_USERNAME"),
		Password: os.Getenv("DB_PASSWORD"),
	}
	return cfg, nil
}

func (c *DBConfig) DSN() string {
	return fmt.Sprintf("%s:%s@tcp(%s:%s)/%s", c.Username, c.Password, c.Host, c.Port, c.Name)
}
