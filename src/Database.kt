package com.library

object Database {
    var isConnected = false

    fun connect() {
        println("Connecting to database...")
        isConnected = true
    }

    fun executeQuery(sql: String) {
        if (!isConnected) {
            println("Error: Not connected to database.")
            return
        }
        println("Executing: $sql")
    }
}
