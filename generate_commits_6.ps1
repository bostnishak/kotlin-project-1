$file = "src/Utils.kt"

$snippets = @(
    "fun isPositive(n: Int): Boolean = n > 0",
    "fun isNegative(n: Int): Boolean = n < 0",
    "fun isZero(n: Int): Boolean = n == 0",
    "fun containsVowel(s: String): Boolean = s.any { it.lowercaseChar() in `"aeiou`" }",
    "fun reverseString(s: String): String = s.reversed()"
)

for ($i = 0; $i -lt $snippets.Length; $i++) {
    $snippet = $snippets[$i]
    $commitNum = $i + 21
    Add-Content -Path $file -Value $snippet
    git add $file
    git commit -m "Add utility function $commitNum"
    git push origin main
    Start-Sleep -Seconds 2
}
