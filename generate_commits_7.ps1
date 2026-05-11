$file = "src/MoreUtils.kt"

if (-not (Test-Path $file)) {
    New-Item -Path $file -ItemType File -Force | Out-Null
}

for ($i = 1; $i -le 25; $i++) {
    $lines = @()
    for ($j = 1; $j -le 18; $j++) {
        $lines += "fun generatedFunction_$i`_$j() { println(`"This is function $j for commit $i`") }"
    }
    
    $content = $lines -join "`n"
    Add-Content -Path $file -Value "`n// Commit $i batch`n$content"
    
    git add $file
    git commit -m "Add utility functions batch $i"
    git push origin main
    Start-Sleep -Seconds 2
}
