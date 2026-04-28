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
