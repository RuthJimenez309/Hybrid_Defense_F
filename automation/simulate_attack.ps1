# Simula Ransomware e Intento de Abuso de Credenciales

$TargetDirectory = ".\evidence\mock_shares"
$LogFile = ".\logs\attack_simulation.log"

if (-not (Test-Path $TargetDirectory)) {
    New-Item -ItemType Directory -Path $TargetDirectory -Force | Out-Null
}

Set-Content -Path "$TargetDirectory\financial_report.xlsx" -Value "CONFIDENTIAL_DATA_2026"
Set-Content -Path "$TargetDirectory\active_directory_dump.txt" -Value "NTLM_HASHES_DUMP_SIMULATED"

Start-Sleep -Seconds 1
Get-ChildItem -Path $TargetDirectory -Include *.xlsx, *.txt -Recurse | ForEach-Object {
    $Content = Get-Content -Path $_.FullName
    $Encoded = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($Content))
    Set-Content -Path "$($_.FullName).locked" -Value $Encoded
    Remove-Item -Path $_.FullName -Force
}

$Timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
$LogEntry = "[$Timestamp] [ATTACK] Ransomware simulation executed. Files encrypted to .locked. Unauthenticated lateral movement attempted."
Set-Content -Path $LogFile -Value $LogEntry

Write-Output "Simulacion ofensiva completada con exito."
