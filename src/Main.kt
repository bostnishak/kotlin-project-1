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
// Auto-generated update 3 at 2026-05-01 11:07:48
// Auto-generated update 4 at 2026-05-01 11:07:53
// Auto-generated update 5 at 2026-05-01 11:07:58
// Auto-generated update 6 at 2026-05-01 11:08:02
// Auto-generated update 7 at 2026-05-01 11:08:07
// Auto-generated update 8 at 2026-05-01 11:08:11
// Auto-generated update 9 at 2026-05-01 11:08:15
// Auto-generated update 10 at 2026-05-01 11:08:19
// Auto-generated update 11 at 2026-05-01 11:08:23
// Auto-generated update 12 at 2026-05-01 11:08:27
// Auto-generated update 13 at 2026-05-01 11:08:31
// Auto-generated update 14 at 2026-05-01 11:08:35
// Auto-generated update 15 at 2026-05-01 11:08:39
// Auto-generated update 16 at 2026-05-01 11:08:43
// Auto-generated update 17 at 2026-05-01 11:08:47
// Auto-generated update 18 at 2026-05-01 11:08:51
