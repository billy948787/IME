#Requires -RunAsAdministrator
<#
.SYNOPSIS
    從系統反登錄 TSF IME（呼叫 regsvr32 /u）。
.PARAMETER DllPath
    MyIME.dll 的完整路徑。預設使用 ..\build\src\MyIME.dll。
#>
param(
    [string]$DllPath = (Join-Path $PSScriptRoot "..\build\src\MyIME.dll")
)

$resolved = Resolve-Path $DllPath -ErrorAction SilentlyContinue
if (-not $resolved) {
    Write-Error "找不到 DLL：$DllPath"
    exit 1
}

Write-Host "正在反登錄 IME：$resolved"
& regsvr32.exe /s /u "$resolved"

if ($LASTEXITCODE -eq 0) {
    Write-Host "反登錄成功！" -ForegroundColor Green
} else {
    Write-Error "反登錄失敗，regsvr32 回傳：$LASTEXITCODE"
    exit $LASTEXITCODE
}
