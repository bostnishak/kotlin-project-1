package com.library

enum class Genre {
    FICTION, NON_FICTION, SCIENCE, HISTORY, FANTASY, BIOGRAPHY, TECHNOLOGY
}

data class Author(
    val id: String,
    val name: String,
    val bio: String
) {
    override fun toString(): String = name
}

data class Book(
    val isbn: String,
    val title: String,
    val author: Author,
    val genre: Genre,
    var isAvailable: Boolean = true
) {
    fun displayInfo(): String {
        val status = if (isAvailable) "Available" else "Borrowed"
        return "$title by $($author.name) [$genre] - $status"
    }
}

class User(
    val id: String,
    val name: String,
    val email: String
) {
    val borrowedBooks = mutableListOf<Book>()

    fun borrow(book: Book) { borrowedBooks.add(book) }
    fun returnBook(book: Book) { borrowedBooks.remove(book) }
    fun getBorrowedCount(): Int = borrowedBooks.size
}
