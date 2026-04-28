$commits = @(
    @{ File = "src/Models.kt"; Message = "Add Author and Genre models"; Code = @"
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
"@ },
    @{ File = "src/Models.kt"; Message = "Add Book model"; Code = @"
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
        val status = if (isAvailable) `"Available`" else `"Borrowed`"
        return `"`$title by `$(`$author.name) [`$genre] - `$status`"
    }
}
"@ },
    @{ File = "src/Models.kt"; Message = "Add User model"; Code = @"
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
        val status = if (isAvailable) `"Available`" else `"Borrowed`"
        return `"`$title by `$(`$author.name) [`$genre] - `$status`"
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
"@ },
    @{ File = "src/Library.kt"; Message = "Initialize Library class"; Code = @"
package com.library

class Library(val name: String) {
    private val books = mutableMapOf<String, Book>()
    private val users = mutableMapOf<String, User>()

    fun getBookCount(): Int = books.size
    fun getUserCount(): Int = users.size
    
    fun printStatus() {
        println(`"Library `$name has `$(`$books.size) books and `$(`$users.size) users.`")
    }
}
"@ },
    @{ File = "src/Library.kt"; Message = "Add book registration methods"; Code = @"
package com.library

class Library(val name: String) {
    private val books = mutableMapOf<String, Book>()
    private val users = mutableMapOf<String, User>()

    fun getBookCount(): Int = books.size
    fun getUserCount(): Int = users.size
    
    fun printStatus() {
        println(`"Library `$name has `$(`$books.size) books and `$(`$users.size) users.`")
    }

    fun addBook(book: Book) {
        if (!books.containsKey(book.isbn)) {
            books[book.isbn] = book
            println(`"Added book: `$(`$book.title)`")
        } else {
            println(`"Book with ISBN `$(`$book.isbn) already exists.`")
        }
    }
}
"@ },
    @{ File = "src/Library.kt"; Message = "Add user registration logic"; Code = @"
package com.library

class Library(val name: String) {
    private val books = mutableMapOf<String, Book>()
    private val users = mutableMapOf<String, User>()

    fun getBookCount(): Int = books.size
    fun getUserCount(): Int = users.size
    
    fun printStatus() {
        println(`"Library `$name has `$(`$books.size) books and `$(`$users.size) users.`")
    }

    fun addBook(book: Book) {
        if (!books.containsKey(book.isbn)) {
            books[book.isbn] = book
            println(`"Added book: `$(`$book.title)`")
        } else {
            println(`"Book with ISBN `$(`$book.isbn) already exists.`")
        }
    }

    fun removeBook(isbn: String) {
        val removed = books.remove(isbn)
        if (removed != null) println(`"Removed book: `$(`$removed.title)`")
    }

    fun registerUser(user: User) {
        if (!users.containsKey(user.id)) {
            users[user.id] = user
            println(`"Registered user: `$(`$user.name)`")
        }
    }
}
"@ },
    @{ File = "src/Library.kt"; Message = "Implement borrow book functionality"; Code = @"
package com.library

class Library(val name: String) {
    private val books = mutableMapOf<String, Book>()
    private val users = mutableMapOf<String, User>()

    fun getBookCount(): Int = books.size
    fun getUserCount(): Int = users.size
    
    fun printStatus() {
        println(`"Library `$name has `$(`$books.size) books and `$(`$users.size) users.`")
    }

    fun addBook(book: Book) {
        if (!books.containsKey(book.isbn)) {
            books[book.isbn] = book
            println(`"Added book: `$(`$book.title)`")
        } else {
            println(`"Book with ISBN `$(`$book.isbn) already exists.`")
        }
    }

    fun removeBook(isbn: String) {
        val removed = books.remove(isbn)
        if (removed != null) println(`"Removed book: `$(`$removed.title)`")
    }

    fun registerUser(user: User) {
        if (!users.containsKey(user.id)) {
            users[user.id] = user
            println(`"Registered user: `$(`$user.name)`")
        }
    }

    fun borrowBook(userId: String, isbn: String): Boolean {
        val user = users[userId]
        val book = books[isbn]

        if (user != null && book != null && book.isAvailable) {
            book.isAvailable = false
            user.borrow(book)
            println(`"`$(`$user.name) successfully borrowed `$(`$book.title)`")
            return true
        }
        println(`"Could not borrow book.`")
        return false
    }
}
"@ },
    @{ File = "src/Library.kt"; Message = "Implement return book functionality"; Code = @"
package com.library

class Library(val name: String) {
    private val books = mutableMapOf<String, Book>()
    private val users = mutableMapOf<String, User>()

    fun getBookCount(): Int = books.size
    fun getUserCount(): Int = users.size
    
    fun printStatus() {
        println(`"Library `$name has `$(`$books.size) books and `$(`$users.size) users.`")
    }

    fun addBook(book: Book) {
        if (!books.containsKey(book.isbn)) {
            books[book.isbn] = book
            println(`"Added book: `$(`$book.title)`")
        } else {
            println(`"Book with ISBN `$(`$book.isbn) already exists.`")
        }
    }

    fun removeBook(isbn: String) {
        val removed = books.remove(isbn)
        if (removed != null) println(`"Removed book: `$(`$removed.title)`")
    }

    fun registerUser(user: User) {
        if (!users.containsKey(user.id)) {
            users[user.id] = user
            println(`"Registered user: `$(`$user.name)`")
        }
    }

    fun borrowBook(userId: String, isbn: String): Boolean {
        val user = users[userId]
        val book = books[isbn]

        if (user != null && book != null && book.isAvailable) {
            book.isAvailable = false
            user.borrow(book)
            println(`"`$(`$user.name) successfully borrowed `$(`$book.title)`")
            return true
        }
        println(`"Could not borrow book.`")
        return false
    }

    fun returnBook(userId: String, isbn: String): Boolean {
        val user = users[userId]
        val book = books[isbn]

        if (user != null && book != null && user.borrowedBooks.contains(book)) {
            book.isAvailable = true
            user.returnBook(book)
            println(`"`$(`$user.name) returned `$(`$book.title)`")
            return true
        }
        println(`"Could not return book.`")
        return false
    }
}
"@ },
    @{ File = "src/Transactions.kt"; Message = "Create LibraryTransaction model"; Code = @"
package com.library

import java.time.LocalDateTime

enum class TransactionType {
    BORROW, RETURN
}

data class LibraryTransaction(
    val id: String,
    val userId: String,
    val bookIsbn: String,
    val type: TransactionType,
    val timestamp: LocalDateTime = LocalDateTime.now()
) {
    fun summary(): String {
        return `"[`$timestamp] `$type: User `$userId -> Book `$bookIsbn`"
    }
}
"@ },
    @{ File = "src/Transactions.kt"; Message = "Add TransactionManager"; Code = @"
package com.library

import java.time.LocalDateTime

enum class TransactionType {
    BORROW, RETURN
}

data class LibraryTransaction(
    val id: String,
    val userId: String,
    val bookIsbn: String,
    val type: TransactionType,
    val timestamp: LocalDateTime = LocalDateTime.now()
) {
    fun summary(): String {
        return `"[`$timestamp] `$type: User `$userId -> Book `$bookIsbn`"
    }
}

class TransactionManager {
    private val transactions = mutableListOf<LibraryTransaction>()

    fun recordTransaction(transaction: LibraryTransaction) {
        transactions.add(transaction)
    }

    fun getTransactionsForUser(userId: String): List<LibraryTransaction> {
        return transactions.filter { it.userId == userId }
    }

    fun printHistory() {
        println(`"--- Transaction History ---`")
        if (transactions.isEmpty()) println(`"No transactions recorded yet.`")
        transactions.forEach { println(it.summary()) }
    }
}
"@ },
    @{ File = "src/Library.kt"; Message = "Integrate TransactionManager into Library"; Code = @"
package com.library

class Library(val name: String) {
    private val books = mutableMapOf<String, Book>()
    private val users = mutableMapOf<String, User>()
    private val transactionManager = TransactionManager()

    fun getBookCount(): Int = books.size
    fun getUserCount(): Int = users.size
    
    fun printStatus() {
        println(`"Library `$name has `$(`$books.size) books and `$(`$users.size) users.`")
    }

    fun addBook(book: Book) {
        if (!books.containsKey(book.isbn)) {
            books[book.isbn] = book
            println(`"Added book: `$(`$book.title)`")
        } else {
            println(`"Book with ISBN `$(`$book.isbn) already exists.`")
        }
    }

    fun removeBook(isbn: String) {
        val removed = books.remove(isbn)
        if (removed != null) println(`"Removed book: `$(`$removed.title)`")
    }

    fun registerUser(user: User) {
        if (!users.containsKey(user.id)) {
            users[user.id] = user
            println(`"Registered user: `$(`$user.name)`")
        }
    }

    private fun record(userId: String, isbn: String, type: TransactionType) {
        val id = java.util.UUID.randomUUID().toString()
        val tx = LibraryTransaction(id, userId, isbn, type)
        transactionManager.recordTransaction(tx)
    }

    fun borrowBook(userId: String, isbn: String): Boolean {
        val user = users[userId]
        val book = books[isbn]

        if (user != null && book != null && book.isAvailable) {
            book.isAvailable = false
            user.borrow(book)
            record(userId, isbn, TransactionType.BORROW)
            println(`"`$(`$user.name) successfully borrowed `$(`$book.title)`")
            return true
        }
        println(`"Could not borrow book.`")
        return false
    }

    fun returnBook(userId: String, isbn: String): Boolean {
        val user = users[userId]
        val book = books[isbn]

        if (user != null && book != null && user.borrowedBooks.contains(book)) {
            book.isAvailable = true
            user.returnBook(book)
            record(userId, isbn, TransactionType.RETURN)
            println(`"`$(`$user.name) returned `$(`$book.title)`")
            return true
        }
        println(`"Could not return book.`")
        return false
    }

    fun printTransactionHistory() {
        transactionManager.printHistory()
    }
}
"@ },
    @{ File = "src/Reviews.kt"; Message = "Add BookReview model"; Code = @"
package com.library

data class BookReview(
    val userId: String,
    val bookIsbn: String,
    val rating: Int,
    val comment: String
) {
    init {
        require(rating in 1..5) { `"Rating must be between 1 and 5`" }
    }
    
    fun display(): String = `"Rating: `$rating/5 - `$comment (by `$userId)`"
}
"@ },
    @{ File = "src/Reviews.kt"; Message = "Add ReviewManager"; Code = @"
package com.library

data class BookReview(
    val userId: String,
    val bookIsbn: String,
    val rating: Int,
    val comment: String
) {
    init {
        require(rating in 1..5) { `"Rating must be between 1 and 5`" }
    }
    
    fun display(): String = `"Rating: `$rating/5 - `$comment (by `$userId)`"
}

class ReviewManager {
    private val reviews = mutableListOf<BookReview>()

    fun addReview(review: BookReview) {
        reviews.add(review)
    }

    fun getReviewsForBook(isbn: String): List<BookReview> {
        return reviews.filter { it.bookIsbn == isbn }
    }

    fun getAverageRating(isbn: String): Double {
        val bookReviews = getReviewsForBook(isbn)
        if (bookReviews.isEmpty()) return 0.0
        return bookReviews.map { it.rating }.average()
    }
}
"@ },
    @{ File = "src/Library.kt"; Message = "Integrate ReviewManager into Library"; Code = @"
package com.library

class Library(val name: String) {
    private val books = mutableMapOf<String, Book>()
    private val users = mutableMapOf<String, User>()
    private val transactionManager = TransactionManager()
    private val reviewManager = ReviewManager()

    fun getBookCount(): Int = books.size
    fun getUserCount(): Int = users.size
    
    fun printStatus() {
        println(`"Library `$name has `$(`$books.size) books and `$(`$users.size) users.`")
    }

    fun addBook(book: Book) {
        if (!books.containsKey(book.isbn)) {
            books[book.isbn] = book
            println(`"Added book: `$(`$book.title)`")
        } else {
            println(`"Book with ISBN `$(`$book.isbn) already exists.`")
        }
    }

    fun removeBook(isbn: String) {
        val removed = books.remove(isbn)
        if (removed != null) println(`"Removed book: `$(`$removed.title)`")
    }

    fun registerUser(user: User) {
        if (!users.containsKey(user.id)) {
            users[user.id] = user
            println(`"Registered user: `$(`$user.name)`")
        }
    }

    private fun record(userId: String, isbn: String, type: TransactionType) {
        val id = java.util.UUID.randomUUID().toString()
        val tx = LibraryTransaction(id, userId, isbn, type)
        transactionManager.recordTransaction(tx)
    }

    fun borrowBook(userId: String, isbn: String): Boolean {
        val user = users[userId]
        val book = books[isbn]

        if (user != null && book != null && book.isAvailable) {
            book.isAvailable = false
            user.borrow(book)
            record(userId, isbn, TransactionType.BORROW)
            println(`"`$(`$user.name) successfully borrowed `$(`$book.title)`")
            return true
        }
        println(`"Could not borrow book.`")
        return false
    }

    fun returnBook(userId: String, isbn: String): Boolean {
        val user = users[userId]
        val book = books[isbn]

        if (user != null && book != null && user.borrowedBooks.contains(book)) {
            book.isAvailable = true
            user.returnBook(book)
            record(userId, isbn, TransactionType.RETURN)
            println(`"`$(`$user.name) returned `$(`$book.title)`")
            return true
        }
        println(`"Could not return book.`")
        return false
    }

    fun addReview(userId: String, isbn: String, rating: Int, comment: String) {
        if (users.containsKey(userId) && books.containsKey(isbn)) {
            reviewManager.addReview(BookReview(userId, isbn, rating, comment))
            println(`"Review added for `$(`$books[isbn]?.title)`")
        }
    }

    fun printTransactionHistory() {
        transactionManager.printHistory()
    }
}
"@ },
    @{ File = "src/Notifications.kt"; Message = "Add Notification interface and models"; Code = @"
package com.library

interface NotificationService {
    fun sendNotification(userId: String, message: String)
}

class EmailNotificationService : NotificationService {
    override fun sendNotification(userId: String, message: String) {
        println(`"-> [EMAIL to User `$userId] `$message`")
    }
}

class SmsNotificationService : NotificationService {
    override fun sendNotification(userId: String, message: String) {
        println(`"-> [SMS to User `$userId] `$message`")
    }
}
"@ },
    @{ File = "src/Library.kt"; Message = "Add notification integration into Library"; Code = @"
package com.library

class Library(val name: String) {
    private val books = mutableMapOf<String, Book>()
    private val users = mutableMapOf<String, User>()
    private val transactionManager = TransactionManager()
    private val reviewManager = ReviewManager()
    private val notificationService: NotificationService = EmailNotificationService()

    fun getBookCount(): Int = books.size
    fun getUserCount(): Int = users.size
    
    fun printStatus() {
        println(`"Library `$name has `$(`$books.size) books and `$(`$users.size) users.`")
    }

    fun addBook(book: Book) {
        if (!books.containsKey(book.isbn)) {
            books[book.isbn] = book
            println(`"Added book: `$(`$book.title)`")
        } else {
            println(`"Book with ISBN `$(`$book.isbn) already exists.`")
        }
    }

    fun removeBook(isbn: String) {
        val removed = books.remove(isbn)
        if (removed != null) println(`"Removed book: `$(`$removed.title)`")
    }

    fun registerUser(user: User) {
        if (!users.containsKey(user.id)) {
            users[user.id] = user
            println(`"Registered user: `$(`$user.name)`")
            notificationService.sendNotification(user.id, `"Welcome to `$name!`")
        }
    }

    private fun record(userId: String, isbn: String, type: TransactionType) {
        val id = java.util.UUID.randomUUID().toString()
        val tx = LibraryTransaction(id, userId, isbn, type)
        transactionManager.recordTransaction(tx)
    }

    fun borrowBook(userId: String, isbn: String): Boolean {
        val user = users[userId]
        val book = books[isbn]

        if (user != null && book != null && book.isAvailable) {
            book.isAvailable = false
            user.borrow(book)
            record(userId, isbn, TransactionType.BORROW)
            println(`"`$(`$user.name) successfully borrowed `$(`$book.title)`")
            notificationService.sendNotification(userId, `"You borrowed `$(`$book.title). Enjoy!`")
            return true
        }
        println(`"Could not borrow book.`")
        return false
    }

    fun returnBook(userId: String, isbn: String): Boolean {
        val user = users[userId]
        val book = books[isbn]

        if (user != null && book != null && user.borrowedBooks.contains(book)) {
            book.isAvailable = true
            user.returnBook(book)
            record(userId, isbn, TransactionType.RETURN)
            println(`"`$(`$user.name) returned `$(`$book.title)`")
            notificationService.sendNotification(userId, `"Thank you for returning `$(`$book.title).`")
            return true
        }
        println(`"Could not return book.`")
        return false
    }

    fun addReview(userId: String, isbn: String, rating: Int, comment: String) {
        if (users.containsKey(userId) && books.containsKey(isbn)) {
            reviewManager.addReview(BookReview(userId, isbn, rating, comment))
            println(`"Review added for `$(`$books[isbn]?.title)`")
        }
    }

    fun printTransactionHistory() {
        transactionManager.printHistory()
    }
}
"@ },
    @{ File = "src/Main.kt"; Message = "Initialize Main application"; Code = @"
package com.library

fun main() {
    println(`"Initializing Library Management System...`")
    val library = Library(`"Central City Library`")
    
    val tolkien = Author(`"a1`", `"J.R.R. Tolkien`", `"English writer`")
    val asimov = Author(`"a2`", `"Isaac Asimov`", `"Sci-Fi author`")
    
    val book1 = Book(`"isbn1`", `"The Hobbit`", tolkien, Genre.FANTASY)
    val book2 = Book(`"isbn2`", `"Foundation`", asimov, Genre.SCIENCE)
    
    library.addBook(book1)
    library.addBook(book2)
    
    library.printStatus()
}
"@ },
    @{ File = "src/Main.kt"; Message = "Add user actions in Main"; Code = @"
package com.library

fun main() {
    println(`"Initializing Library Management System...`")
    val library = Library(`"Central City Library`")
    
    val tolkien = Author(`"a1`", `"J.R.R. Tolkien`", `"English writer`")
    val asimov = Author(`"a2`", `"Isaac Asimov`", `"Sci-Fi author`")
    
    val book1 = Book(`"isbn1`", `"The Hobbit`", tolkien, Genre.FANTASY)
    val book2 = Book(`"isbn2`", `"Foundation`", asimov, Genre.SCIENCE)
    
    library.addBook(book1)
    library.addBook(book2)
    
    val user1 = User(`"u1`", `"Alice Smith`", `"alice@example.com`")
    val user2 = User(`"u2`", `"Bob Jones`", `"bob@example.com`")
    
    library.registerUser(user1)
    library.registerUser(user2)
    
    library.printStatus()
}
"@ },
    @{ File = "src/Main.kt"; Message = "Simulate library flows"; Code = @"
package com.library

fun main() {
    println(`"Initializing Library Management System...`")
    val library = Library(`"Central City Library`")
    
    val tolkien = Author(`"a1`", `"J.R.R. Tolkien`", `"English writer`")
    val asimov = Author(`"a2`", `"Isaac Asimov`", `"Sci-Fi author`")
    
    val book1 = Book(`"isbn1`", `"The Hobbit`", tolkien, Genre.FANTASY)
    val book2 = Book(`"isbn2`", `"Foundation`", asimov, Genre.SCIENCE)
    
    library.addBook(book1)
    library.addBook(book2)
    
    val user1 = User(`"u1`", `"Alice Smith`", `"alice@example.com`")
    val user2 = User(`"u2`", `"Bob Jones`", `"bob@example.com`")
    
    library.registerUser(user1)
    library.registerUser(user2)
    
    println(`"\n--- Simulating Actions ---`")
    library.borrowBook(`"u1`", `"isbn1`")
    library.borrowBook(`"u2`", `"isbn2`")
    
    library.printStatus()
}
"@ },
    @{ File = "src/Main.kt"; Message = "Finalize execution flow"; Code = @"
package com.library

fun main() {
    println(`"Initializing Library Management System...`")
    val library = Library(`"Central City Library`")
    
    val tolkien = Author(`"a1`", `"J.R.R. Tolkien`", `"English writer`")
    val asimov = Author(`"a2`", `"Isaac Asimov`", `"Sci-Fi author`")
    
    val book1 = Book(`"isbn1`", `"The Hobbit`", tolkien, Genre.FANTASY)
    val book2 = Book(`"isbn2`", `"Foundation`", asimov, Genre.SCIENCE)
    
    library.addBook(book1)
    library.addBook(book2)
    
    val user1 = User(`"u1`", `"Alice Smith`", `"alice@example.com`")
    val user2 = User(`"u2`", `"Bob Jones`", `"bob@example.com`")
    
    library.registerUser(user1)
    library.registerUser(user2)
    
    println(`"\n--- Simulating Actions ---`")
    library.borrowBook(`"u1`", `"isbn1`")
    library.borrowBook(`"u2`", `"isbn2`")
    
    library.returnBook(`"u1`", `"isbn1`")
    library.addReview(`"u1`", `"isbn1`", 5, `"Amazing book! A true classic.`")
    
    println(`"\n--- Final Reports ---`")
    library.printStatus()
    library.printTransactionHistory()
}
"@ }
)

mkdir -Force src | Out-Null

foreach ($commit in $commits) {
    Set-Content -Path $commit.File -Value $commit.Code -Encoding UTF8
    git add .
    git commit -m $commit.Message
    git push -u origin main
}
