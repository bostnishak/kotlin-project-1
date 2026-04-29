package com.library

class Reports {
    fun generateSummary(): String {
        return "Library Summary Report\n-----------------------"
    }

    fun generateUserReport(userId: String): String {
        return "Report for User $userId"
    }

    fun generateInventoryReport(bookCount: Int): String {
        return "Total Books in Inventory: $bookCount"
    }
}
