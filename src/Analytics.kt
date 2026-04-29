package com.library

object Analytics {
    private val eventLogs = mutableListOf<String>()

    fun logEvent(event: String) {
        eventLogs.add(event)
    }
}
