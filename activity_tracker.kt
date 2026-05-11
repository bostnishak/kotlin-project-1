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

fun calculateAverage(numbers: List<Double>): Double {
    if (numbers.isEmpty()) return 0.0
    return numbers.sum() / numbers.size
}

fun reverseString(input: String): String {
    return input.reversed()
}

