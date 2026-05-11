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

fun bytesToHex(bytes: ByteArray): String {
    return bytes.joinToString("") { "%02x".format(it) }
}

fun splitChunks(list: List<Int>, size: Int): List<List<Int>> {
    return list.chunked(size)
}

fun mapToQueryString(params: Map<String, String>): String {
    return params.entries.joinToString("&") { "=" }
}

fun readableFileSize(size: Long): String {
    val kb = size / 1024.0
    val mb = kb / 1024.0
    return if (mb >= 1) "%.2f MB".format(mb) else "%.2f KB".format(kb)
}

fun getEnvOrDefault(key: String, default: String): String {
    return System.getenv(key) ?: default
}

fun isValidEmail(email: String): Boolean {
    val regex = Regex("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,6}$")
    return regex.matches(email)
}

fun truncate(text: String, maxLen: Int): String {
    return if (text.length <= maxLen) text else text.take(maxLen) + "..."
}

fun randomString(length: Int): String {
    val chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    return (1..length).map { chars.random() }.joinToString("")
}

fun median(numbers: List<Double>): Double {
    val sorted = numbers.sorted()
    val mid = sorted.size / 2
    return if (sorted.size % 2 == 0) (sorted[mid - 1] + sorted[mid]) / 2 else sorted[mid]
}

fun groupByFirstChar(words: List<String>): Map<Char, List<String>> {
    return words.groupBy { it.first() }
}

