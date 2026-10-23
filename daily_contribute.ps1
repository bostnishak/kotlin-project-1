param (
    [int]$Count = 30
)

$fileToModify = "dummy_contribution.kt"
$batchId = Get-Date -Format "yyyyMMdd_HHmmss"

Write-Host "Starting daily contribution script for Kotlin project ($Count iterations)..." -ForegroundColor Cyan

for ($i = 1; $i -le $Count; $i++) {
    $currentDate = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    
    # 5 satır Kotlin kodu
    $codeLines = @(
        "// Contribution $i - $currentDate",
        "fun contribution_${batchId}_${i}() {",
        "    val iteration = $i",
        "    println(`"Contribution $iteration recorded at $currentDate`")",
        "}"
    )
    
    # Dosyaya 5 satır ekle
    Add-Content -Path $fileToModify -Value $codeLines -Encoding UTF8
    
    Write-Host "[$i/$Count] Added 5 lines of code to $fileToModify" -ForegroundColor Yellow
    
    # Git işlemleri
    git add $fileToModify
    git commit -m "Auto commit for contribution: iteration $i ($currentDate)"
    git push
    
    Write-Host "[$i/$Count] Committed and pushed successfully." -ForegroundColor Green
    
    # GitHub rate limiting koruması için kısa bekleme
    Start-Sleep -Seconds 1
}

Write-Host "Completed all $Count contributions successfully!" -ForegroundColor Green
