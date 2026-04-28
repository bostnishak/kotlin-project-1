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
    
    library.printStatus()
}
