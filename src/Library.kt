package com.library

class Library(val name: String) {
    private val books = mutableMapOf<String, Book>()
    private val users = mutableMapOf<String, User>()

    fun getBookCount(): Int = books.size
    fun getUserCount(): Int = users.size
    
    fun printStatus() {
        println("Library $name has $($books.size) books and $($users.size) users.")
    }
}
