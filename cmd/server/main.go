package main

import (
	"log"
	"net/http"

	"github.com/joho/godotenv"
)

const (
	serverPort = "8080"
)

func main() {
	log.Println("Starting Bag of Holding...")

	err := godotenv.Load()
	if err != nil {
		log.Fatalf("Failed to load .env: %v", err)
	}

	serveMux := http.NewServeMux()
	server := http.Server{
		Handler: serveMux,
		Addr:    ":" + serverPort,
	}
	log.Fatal(server.ListenAndServe())
}
