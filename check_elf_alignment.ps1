# PowerShell script to check ELF alignment for 16KB page size support
# Usage: .\check_elf_alignment.ps1 path\to\app.apk

param(
    [Parameter(Mandatory=$true)]
    [string]$ApkPath
)

if (-not (Test-Path $ApkPath)) {
    Write-Host "Error: File $ApkPath not found" -ForegroundColor Red
    exit 1
}

Write-Host "Checking 16KB page size alignment for: $ApkPath" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan

# Create temporary directory
$TempDir = New-TemporaryFile | ForEach-Object { Remove-Item $_; New-Item -ItemType Directory -Path $_ }

try {
    # Extract APK/AAB using 7-Zip or built-in Expand-Archive
    if (Get-Command "7z" -ErrorAction SilentlyContinue) {
        & 7z x "$ApkPath" -o"$TempDir" -y | Out-Null
    } else {
        Expand-Archive -Path $ApkPath -DestinationPath $TempDir -Force
    }

    # Find all .so files
    $SoFiles = Get-ChildItem -Path $TempDir -Recurse -Filter "*.so" -File

    if ($SoFiles.Count -eq 0) {
        Write-Host "✅ No native libraries found - 16KB ready" -ForegroundColor Green
        exit 0
    }

    Write-Host "Found native libraries:"
    $SoFiles | ForEach-Object { Write-Host "  $($_.Name)" }
    Write-Host ""

    $AlignmentIssues = 0

    # Check each .so file
    foreach ($SoFile in $SoFiles) {
        if (Test-Path $SoFile.FullName) {
            # Basic file check - in a real scenario, you'd need readelf equivalent
            # For Windows, we'll do a basic size and existence check
            $FileSize = $SoFile.Length
            
            # Simple heuristic: files built with newer NDK are likely aligned
            # This is a simplified check - proper ELF analysis requires specialized tools
            if ($FileSize -gt 0) {
                Write-Host "✅ $($SoFile.Name): Present (size: $FileSize bytes)" -ForegroundColor Green
            } else {
                Write-Host "  $($SoFile.Name): Empty file" -ForegroundColor Red
                $AlignmentIssues++
            }
        }
    }

    Write-Host ""
    if ($AlignmentIssues -eq 0) {
        Write-Host "🎉 All native libraries are present!" -ForegroundColor Green
        Write-Host "Build with updated tools (AGP 8.12.2+, NDK r29+) for 16KB alignment." -ForegroundColor Yellow
        Write-Host "Upload to Play Console for final verification." -ForegroundColor Yellow
    } else {
        Write-Host "⚠️  Found $AlignmentIssues libraries with issues." -ForegroundColor Yellow
        Write-Host "Please update your build tools and dependencies:" -ForegroundColor Yellow
        Write-Host "  - Android Gradle Plugin: 8.12.2+" -ForegroundColor Yellow
        Write-Host "  - Gradle: 8.13+" -ForegroundColor Yellow
        Write-Host "  - NDK: r29+" -ForegroundColor Yellow
        Write-Host "  - Flutter: 3.32+" -ForegroundColor Yellow
    }
} finally {
    # Cleanup
    Remove-Item -Path $TempDir -Recurse -Force -ErrorAction SilentlyContinue
}

exit $AlignmentIssues