package com.library

fun String.toTitleCase(): String {
    return this.split(" ").joinToString(" ") { it.capitalize() }
}

fun String.truncate(maxLength: Int): String {
    if (this.length <= maxLength) return this
    return this.substring(0, maxLength - 3) + "..."
}

fun Boolean.toYesNo(): String {
    return if (this) "Yes" else "No"
}
