// dib2gb.h : main header file for the DIBLOOK application
//
// This is a part of the Microsoft Foundation Classes C++ library.
// Copyright (c) Microsoft Corporation.  All rights reserved.
//
// This source code is only intended as a supplement to the
// Microsoft Foundation Classes Reference and related
// electronic documentation provided with the library.
// See these sources for detailed information regarding the
// Microsoft Foundation Classes product.

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"           // main symbols

#define WM_DOREALIZE   (WM_USER + 0)

/////////////////////////////////////////////////////////////////////////////
// CDib2GBApp:
// See dib2gb.cpp for the implementation of this class
//

class CDib2GBApp : public CWinApp
{
public:
	CDib2GBApp();

// Overrides
	virtual BOOL InitInstance();

// Implementation

	//{{AFX_MSG(CDib2GBApp)
	afx_msg void OnAppAbout();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////
