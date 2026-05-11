// Activity Tracker - Kotlin Utilities

fun validateInput(input: String): Boolean {
    if (input.isBlank()) return false
    val regex = Regex("^[a-zA-Z0-9_]+$")
    return regex.matches(input)
}

