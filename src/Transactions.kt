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
        return "[$timestamp] $type: User $userId -> Book $bookIsbn"
    }
}
