# Recoleccion Volatil y Preservacion con Cadena de Custodia Criptografica

$EvidenceDir = ".\evidence"
$ReportFile = ".\reports\forensic_triage_report.md"
$Timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")

Write-Output "Iniciando triaje forense en vivo y recoleccion de evidencias..."

# 1. Recoleccion de Evidencia Volatil (Artefactos de Sistema en Vivo)
$ActiveConnections = Get-NetTCPConnection | Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, State | ConvertTo-Json
$RunningProcesses = Get-Process | Select-Object Id, ProcessName, CPU, Path | ConvertTo-Json

# 2. Preservacion de Evidencia Digital mediante Hashing 
$PreservedFiles = @()
$LockedFiles = Get-ChildItem -Path "$EvidenceDir\mock_shares" -Filter *.locked -ErrorAction SilentlyContinue

foreach ($File in $LockedFiles) {
    $Hash = (Get-FileHash -Path $File.FullName -Algorithm SHA256).Hash
    $PreservedFiles += [PSCustomObject]@{
        Filename  = $File.Name
        Extension = $File.Extension
        SizeInBytes = $File.Length
        SHA256Hash = $Hash
    }
}

$ChainOfCustodyJson = $PreservedFiles | ConvertTo-Json

# 3. Generacion del Reporte Forense Estructurado en Markdown
$ReportContent = @"
# REPORTE DE ANALISIS FORENSE DIGITAL E INCIDENTES - DIA 19
**Fecha y Hora del Analisis:** $Timestamp
**Analista a Cargo:** Equipo de Seguridad Corporativa

## 1. Evidencia Criptografica de Archivos Cifrados (Cadena de Custodia)
Los siguientes archivos sufrieron alteraciones por el payload simulado y han sido fijados matematicamente:
$( $PreservedFiles | Out-String )

## 2. Artefactos Volatiles Recolectados (Conexiones de Red Activas)
```json
\$ActiveConnections
```

## 3. Artefactos Volatiles Recolectados (Procesos en Ejecucion)
```json
\$RunningProcesses
```
"@

Set-Content -Path $ReportFile -Value $ReportContent
Write-Output "Triaje completado. Reporte y cadena de custodia generados en: $ReportFile"
