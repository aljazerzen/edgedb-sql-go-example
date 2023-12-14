package main

import (
	"log"

	"database/sql"

	_ "github.com/lib/pq"
)

func main() {
	// connStr := "postgres://edgedb@localhost:5656/edgedb?sslmode=require"
	// db, err := sql.Open("postgres", connStr)

	connStr := "host=localhost port=5656 user=edgedb dbname=edgedb sslmode=require"
	db, err := sql.Open("postgres", connStr)
	if err != nil {
		panic(err)
	}
	defer db.Close()

	rows, err := db.Query("SELECT id, title, genre_id FROM \"Movie\"")
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	log.Printf("%40s %40s %40s", "id", "title", "genre_id");
	for rows.Next() {
		var id string
		var title string
		var genre_id string
		if err := rows.Scan(&id, &title, &genre_id); err != nil {
			log.Fatal(err)
		}
		log.Printf("%40s %40s %40s", id, title, genre_id);
	}
	// Check for errors from iterating over rows.
	if err := rows.Err(); err != nil {
		log.Fatal(err)
	}	
}
