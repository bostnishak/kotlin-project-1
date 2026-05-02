// Utility Functions
fun add(a: Int, b: Int): Int = a + b
fun subtract(a: Int, b: Int): Int = a - b
fun multiply(a: Int, b: Int): Int = a * b
fun divide(a: Int, b: Int): Double = a.toDouble() / b
fun isEven(n: Int): Boolean = n % 2 == 0
fun isOdd(n: Int): Boolean = n % 2 != 0
fun square(n: Int): Int = n * n
fun cube(n: Int): Int = n * n * n
fun greet(name: String): String = "Hello, $name!"
fun max(a: Int, b: Int): Int = if (a > b) a else b
fun factorial(n: Int): Int = if (n <= 1) 1 else n * factorial(n - 1)
fun lengthOfString(s: String): Int = s.length
fun toUpperCase(s: String): String = s.uppercase()
