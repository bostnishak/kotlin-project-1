package com.library

data class AppConfig(
    val appName: String = "Library Manager",
    val version: String = "1.0.0",
    val maxUsers: Int = 1000
)

val defaultConfig = AppConfig()
