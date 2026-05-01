package com.library

fun main() {
    println("Initializing Library Management System...")
    val library = Library("Central City Library")
    
    val tolkien = Author("a1", "J.R.R. Tolkien", "English writer")
    val asimov = Author("a2", "Isaac Asimov", "Sci-Fi author")
    
    val book1 = Book("isbn1", "The Hobbit", tolkien, Genre.FANTASY)
    val book2 = Book("isbn2", "Foundation", asimov, Genre.SCIENCE)
    
    library.addBook(book1)
    library.addBook(book2)
    
    val user1 = User("u1", "Alice Smith", "alice@example.com")
    val user2 = User("u2", "Bob Jones", "bob@example.com")
    
    library.registerUser(user1)
    library.registerUser(user2)
    
    println("\n--- Simulating Actions ---")
    library.borrowBook("u1", "isbn1")
    library.borrowBook("u2", "isbn2")
    
    library.returnBook("u1", "isbn1")
    library.addReview("u1", "isbn1", 5, "Amazing book! A true classic.")
    
    println("\n--- Final Reports ---")
    library.printStatus()
    library.printTransactionHistory()
}
// Auto-generated update 1 at 2026-05-01 11:07:40
// Auto-generated update 2 at 2026-05-01 11:07:44
