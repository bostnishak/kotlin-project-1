package com.library

object Analytics {
    private val eventLogs = mutableListOf<String>()
    private val bookViews = mutableMapOf<String, Int>()

    fun logEvent(event: String) {
        eventLogs.add(event)
    }

    fun logBookView(isbn: String) {
        val count = bookViews.getOrDefault(isbn, 0)
        bookViews[isbn] = count + 1
        logEvent("Viewed book: $isbn")
    }
}
