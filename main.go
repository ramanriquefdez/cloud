package main

import (
	"fmt"
	"log"
	"net/http"
	"strconv"
)

func helloHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hola, mundo!")
}

func main() {
	http.HandleFunc("/hello", helloHandler)
	http.HandleFunc("/fibonacci", fibHandler)
	log.Fatal(http.ListenAndServe(":8080", nil))
}

func fibonacci(n int) int {
	if n <= 1 {
		return n
	}
	return fibonacci(n-1) + fibonacci(n-2)
}

func fibHandler(w http.ResponseWriter, r *http.Request) {
	log.Printf("Called fibonnaci")
	param := r.URL.Query().Get("n")
	n, err := strconv.Atoi(param)
	if err != nil {
		log.Printf("Error:%v", err)
		http.Error(w, "Invalid parameter", http.StatusBadRequest)
		return
	}
	result := strconv.Itoa(fibonacci(n))
	w.Write([]byte(result))
	log.Printf("Fibonacci resolved")
}
