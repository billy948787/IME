#Requires -RunAsAdministrator
<#
.SYNOPSIS
    向系統登錄 TSF IME（呼叫 regsvr32）。
.PARAMETER DllPath
    MyIME.dll 的完整路徑。預設使用 ..\build\src\MyIME.dll。
#>
param(
    [string]$DllPath = (Join-Path $PSScriptRoot "..\build\src\MyIME.dll")
)

$resolved = Resolve-Path $DllPath -ErrorAction SilentlyContinue
if (-not $resolved) {
    Write-Error "找不到 DLL：$DllPath`n請先執行 cmake --build 後再試。"
    exit 1
}

Write-Host "正在登錄 IME：$resolved"
& regsvr32.exe /s "$resolved"

if ($LASTEXITCODE -eq 0) {
    Write-Host "登錄成功！" -ForegroundColor Green
} else {
    Write-Error "登錄失敗，regsvr32 回傳：$LASTEXITCODE"
    exit $LASTEXITCODE
}
