#pragma once
// dibdoc.h : interface of the CDibDoc class
//
// This is a part of the Microsoft Foundation Classes C++ library.
// Copyright (c) Microsoft Corporation.  All rights reserved.
//
// This source code is only intended as a supplement to the
// Microsoft Foundation Classes Reference and related
// electronic documentation provided with the library.
// See these sources for detailed information regarding the
// Microsoft Foundation Classes product.

#include "dibapi.h"
#include "gbformat.h"

class CDibDoc : public CDocument
{
protected: // create from serialization only
	CDibDoc();
	DECLARE_DYNCREATE(CDibDoc)

// Attributes
public:
	HDIB GetHDIB() const
		{ return m_hDIB; }
	CPalette* GetDocPalette() const
		{ return m_palDIB; }
	CSize GetDocSize() const
		{ return m_sizeDoc; }

// Operations
public:
	void ReplaceHDIB(HDIB hDIB);
	void InitDIBData();

// Implementation
protected:
	virtual ~CDibDoc();
	virtual BOOL OnSaveDocument(LPCTSTR lpszPathName);
	virtual BOOL OnOpenDocument(LPCTSTR lpszPathName);
	virtual BOOL DoSave(LPCTSTR lpszPathName, BOOL bReplace = TRUE);
	virtual BOOL DoFileSave();
	BOOL DoSaveAll(LPCTSTR lpszPathName, BOOL bReplace = TRUE);

protected:
	HDIB m_hDIB;
	CPalette* m_palDIB;
	CSize m_sizeDoc;
    static CString m_Group_Title;
    bool m_tile_map; // use tile map for this bit map
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif
protected:
	virtual BOOL    OnNewDocument();

// Generated message map functions
protected:
	//{{AFX_MSG(CDibDoc)
	//}}AFX_MSG
    afx_msg void OnFileSaveAll();
    afx_msg void OnUpdateFileSaveAll(CCmdUI *pCmdUI);
    afx_msg void OnFileSaveAllAs();
    afx_msg void OnUpdateFileSaveAllAs(CCmdUI *pCmdUI);
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////
