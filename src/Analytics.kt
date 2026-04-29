package com.library

object Analytics {
    private val eventLogs = mutableListOf<String>()
    private val bookViews = mutableMapOf<String, Int>()
    private var searchQueries = 0
    private val activeUsers = mutableSetOf<String>()

    fun logEvent(event: String) {
        eventLogs.add(event)
    }

    fun logBookView(isbn: String) {
        val count = bookViews.getOrDefault(isbn, 0)
        bookViews[isbn] = count + 1
        logEvent("Viewed book: $isbn")
    }

    fun logSearchQuery(query: String) {
        searchQueries++
        logEvent("User searched for: $query")
    }

    fun logUserActive(userId: String) {
        activeUsers.add(userId)
    }

    fun getStats(): String {
        return "Total Searches: $searchQueries, Active Users: $($activeUsers.size)"
    }
}
