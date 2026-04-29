package com.library

fun String.toTitleCase(): String {
    return this.split(" ").joinToString(" ") { it.capitalize() }
}
