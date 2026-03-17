# 設定
cmake --preset x64-release

# 建置
cmake --build --preset x64-release-build

# 查看所有可用 preset
cmake --list-presets
cmake --build --list-presets

# register
register.ps1
unregister.ps1

# 測試
務必開新視窗的記事本 (確保載入新版dll)

# cmake 無法寫入 dll
把原本的dll改名(因為刪不掉，重開機再刪除)