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

fun isPrime(n: Int): Boolean {
    if (n < 2) return false
    for (i in 2..Math.sqrt(n.toDouble()).toInt()) {
        if (n % i == 0) return false
    }
    return true
}

fun clamp(value: Int, min: Int, max: Int): Int {
    return maxOf(min, minOf(max, value))
}

fun countWords(text: String): Int {
    if (text.isBlank()) return 0
    return text.trim().split(Regex("\s+")).size
}

fun toTitleCase(str: String): String {
    return str.split(" ").joinToString(" ") { it.capitalize() }
}

fun fibonacci(n: Int): Long {
    if (n <= 1) return n.toLong()
    var a = 0L; var b = 1L
    repeat(n - 1) { val temp = a + b; a = b; b = temp }
    return b
}

fun retry(times: Int, block: () -> Unit) {
    repeat(times) {
        try { block(); return } catch (e: Exception) { }
    }
}

