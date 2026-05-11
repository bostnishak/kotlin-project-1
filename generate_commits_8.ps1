for ($i=1; $i -le 15; $i++) {
    Add-Content -Path "contribution_log.txt" -Value "Contribution commit $i at $(Get-Date)"
    git add contribution_log.txt
    git commit -m "feat: contribution update $i"
    git push
    Start-Sleep -Seconds 1
}
