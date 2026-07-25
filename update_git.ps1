# Git Auto Update Script for SW-Cafe
Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host "          SW-Cafe Git Repository Update Tool            " -ForegroundColor Cyan
Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host ""

git status

Write-Host "`nStaging changes..." -ForegroundColor Yellow
git add .

$commitMsg = Read-Host -Prompt "Enter commit message (Press Enter for default: 'Update SW-Cafe website')"
if ([string]::IsNullOrWhiteSpace($commitMsg)) {
    $commitMsg = "Update SW-Cafe website"
}

Write-Host "`nCommitting changes with message: '$commitMsg'..." -ForegroundColor Yellow
git commit -m "$commitMsg"

Write-Host "`nPushing changes to GitHub (origin main)..." -ForegroundColor Yellow
git push origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n=======================================================" -ForegroundColor Green
    Write-Host "          SUCCESS: Git Update Completed!               " -ForegroundColor Green
    Write-Host "=======================================================" -ForegroundColor Green
} else {
    Write-Host "`n=======================================================" -ForegroundColor Red
    Write-Host "          ERROR: Failed to push to GitHub.             " -ForegroundColor Red
    Write-Host "=======================================================" -ForegroundColor Red
}

Read-Host -Prompt "Press Enter to exit..."
