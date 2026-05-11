// Activity Tracker - Kotlin Utilities

fun validateInput(input: String): Boolean {
    if (input.isBlank()) return false
    val regex = Regex("^[a-zA-Z0-9_]+$")
    return regex.matches(input)
}

fun formatDate(timestamp: Long): String {
    val sdf = java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
    return sdf.format(java.util.Date(timestamp))
}

