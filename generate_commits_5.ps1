$file = "src/Utils.kt"

$snippets = @(
    "fun add(a: Int, b: Int): Int = a + b",
    "fun subtract(a: Int, b: Int): Int = a - b",
    "fun multiply(a: Int, b: Int): Int = a * b",
    "fun divide(a: Int, b: Int): Double = a.toDouble() / b",
    "fun isEven(n: Int): Boolean = n % 2 == 0",
    "fun isOdd(n: Int): Boolean = n % 2 != 0",
    "fun square(n: Int): Int = n * n",
    "fun cube(n: Int): Int = n * n * n",
    "fun greet(name: String): String = `"Hello, `$name!`"",
    "fun max(a: Int, b: Int): Int = if (a > b) a else b",
    "fun min(a: Int, b: Int): Int = if (a < b) a else b",
    "fun absolute(n: Int): Int = if (n < 0) -n else n",
    "fun factorial(n: Int): Int = if (n <= 1) 1 else n * factorial(n - 1)",
    "fun lengthOfString(s: String): Int = s.length",
    "fun toUpperCase(s: String): String = s.uppercase()",
    "fun toLowerCase(s: String): String = s.lowercase()",
    "fun isBlank(s: String): Boolean = s.isBlank()",
    "fun isEmpty(s: String): Boolean = s.isEmpty()",
    "fun doubleValue(n: Int): Int = n * 2",
    "fun halfValue(n: Int): Double = n / 2.0"
)

if (-not (Test-Path $file)) {
    Set-Content -Path $file -Value "// Utility Functions"
    git add $file
    git commit -m "Initial commit for Utils.kt"
    git push origin main
}

for ($i = 0; $i -lt $snippets.Length; $i++) {
    $snippet = $snippets[$i]
    $commitNum = $i + 1
    Add-Content -Path $file -Value $snippet
    git add $file
    git commit -m "Add utility function $commitNum"
    git push origin main
    Start-Sleep -Seconds 2
}
