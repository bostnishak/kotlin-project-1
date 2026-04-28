package com.library

data class BookReview(
    val userId: String,
    val bookIsbn: String,
    val rating: Int,
    val comment: String
) {
    init {
        require(rating in 1..5) { "Rating must be between 1 and 5" }
    }
    
    fun display(): String = "Rating: $rating/5 - $comment (by $userId)"
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
