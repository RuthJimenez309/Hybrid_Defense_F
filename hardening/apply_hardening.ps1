$VulnerableAccounts = Get-LocalUser | Where-Object { $_.PasswordRequired -eq $false -and $_.Enabled -eq $true } | Select-Object Name, Enabled | Out-String
$Hotfixes = Get-HotFix | Select-Object Description, HotFixID, InstalledOn | Out-String
$HostsPath = "$env:windir\System32\drivers\etc\hosts"
$HostsHash = (Get-FileHash -Path $HostsPath -Algorithm SHA256).Hash
Write-Output "=================================================="
Write-Output "  REPORTE DE AUDITORIA E INVESTIGACION DE SEGURIDAD"
Write-Output "=================================================="
Write-Output "[+] CUENTAS ACTIVAS CON RIESGO DE CONTRASEÑA:"
Write-Output $VulnerableAccounts
Write-Output "[+] REPORTE DE ACTUALIZACIONES DETECTADAS:"
Write-Output $Hotfixes
Write-Output "[+] MONITOREO DE INTEGRIDAD DE ARCHIVOS (FIM):"
Write-Output "Archivo auditado: $HostsPath"
Write-Output "Hash (SHA256): $HostsHash"
