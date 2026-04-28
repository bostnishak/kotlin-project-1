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

class TransactionManager {
    private val transactions = mutableListOf<LibraryTransaction>()

    fun recordTransaction(transaction: LibraryTransaction) {
        transactions.add(transaction)
    }

    fun getTransactionsForUser(userId: String): List<LibraryTransaction> {
        return transactions.filter { it.userId == userId }
    }

    fun printHistory() {
        println("--- Transaction History ---")
        if (transactions.isEmpty()) println("No transactions recorded yet.")
        transactions.forEach { println(it.summary()) }
    }
}
