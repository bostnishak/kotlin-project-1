package com.library

class Library(val name: String) {
    private val books = mutableMapOf<String, Book>()
    private val users = mutableMapOf<String, User>()

    fun getBookCount(): Int = books.size
    fun getUserCount(): Int = users.size
    
    fun printStatus() {
        println("Library $name has $($books.size) books and $($users.size) users.")
    }

    fun addBook(book: Book) {
        if (!books.containsKey(book.isbn)) {
            books[book.isbn] = book
            println("Added book: $($book.title)")
        } else {
            println("Book with ISBN $($book.isbn) already exists.")
        }
    }

    fun removeBook(isbn: String) {
        val removed = books.remove(isbn)
        if (removed != null) println("Removed book: $($removed.title)")
    }

    fun registerUser(user: User) {
        if (!users.containsKey(user.id)) {
            users[user.id] = user
            println("Registered user: $($user.name)")
        }
    }
}
