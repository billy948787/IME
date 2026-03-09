#pragma once

#include <windows.h>

// ============================================================
//  TSF / COM 伺服器的註冊與反註冊
//  由 DllRegisterServer / DllUnregisterServer 呼叫。
//  需要系統管理員權限（寫入 HKEY_LOCAL_MACHINE）。
// ============================================================

HRESULT RegisterServer();
HRESULT UnregisterServer();
