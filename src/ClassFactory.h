#pragma once

#include <unknwn.h>
#include <windows.h>


// ============================================================
//  CClassFactory
//  COM Class Factory：負責建立 CTextService 實體。
// ============================================================
class CClassFactory : public IClassFactory {
public:
    CClassFactory();

    // IUnknown
    STDMETHODIMP QueryInterface(REFIID riid, void** ppv) override;
    STDMETHODIMP_(ULONG) AddRef() override;
    STDMETHODIMP_(ULONG) Release() override;

    // IClassFactory
    STDMETHODIMP CreateInstance(IUnknown* pUnkOuter, REFIID riid, void** ppv) override;
    STDMETHODIMP LockServer(BOOL fLock) override;

private:
    LONG _cRef;
};
