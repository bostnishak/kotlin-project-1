package com.library

object Database {
    var isConnected = false

    fun connect() {
        println("Connecting to database...")
        isConnected = true
    }
}
