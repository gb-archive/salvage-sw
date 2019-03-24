// dibdoc.cpp : implementation of the CDibDoc class
//
// This is a part of the Microsoft Foundation Classes C++ library.
// Copyright (c) Microsoft Corporation.  All rights reserved.
//
// This source code is only intended as a supplement to the
// Microsoft Foundation Classes Reference and related
// electronic documentation provided with the library.
// See these sources for detailed information regarding the
// Microsoft Foundation Classes product.

#include "stdafx.h"
#include <afxdlgs.h>
#include "dib2gb.h"
#include <limits.h>

#include "dibdoc.h"
#include "gbformat.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

#include <string>
#include ".\dibdoc.h"
/*************************************************************************
 *
 * gbsave()
 *
 * CFile& file - open CFile used to save
 *
 * Return value: TRUE if successful, else FALSE or CFileException
 *
 *************************************************************************/

BOOL WINAPI gbsave(GBData & gbd, CFile& file)
{
	TRY
	{
        std::string output;
        gbd.render(output);
        file.Write(output.c_str(), output.size());
	}
	CATCH (CFileException, e)
	{
		THROW_LAST();
	}
	END_CATCH

	return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// CDibDoc

IMPLEMENT_DYNCREATE(CDibDoc, CDocument)

BEGIN_MESSAGE_MAP(CDibDoc, CDocument)
	//{{AFX_MSG_MAP(CDibDoc)
	//}}AFX_MSG_MAP
    ON_COMMAND(ID_FILE_SAVEALL, OnFileSaveAll)
    ON_UPDATE_COMMAND_UI(ID_FILE_SAVEALL, OnUpdateFileSaveAll)
    ON_COMMAND(ID_FILE_SAVEALLAS, OnFileSaveAllAs)
    ON_UPDATE_COMMAND_UI(ID_FILE_SAVEALLAS, OnUpdateFileSaveAllAs)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDibDoc construction/destruction

CDibDoc::CDibDoc() :
    m_tile_map(true)
{
	m_hDIB = NULL;
	m_palDIB = NULL;
	m_sizeDoc = CSize(1,1);     // dummy value to make CScrollView happy
}

CDibDoc::~CDibDoc()
{
	if (m_hDIB != NULL)
	{
		::GlobalFree((HGLOBAL) m_hDIB);
	}
	if (m_palDIB != NULL)
	{
		delete m_palDIB;
	}
}

BOOL CDibDoc::OnNewDocument()
{
    /*
	if (!CDocument::OnNewDocument())
		return FALSE;
	return TRUE;
    */
    return FALSE;
}

void CDibDoc::InitDIBData()
{
	if (m_palDIB != NULL)
	{
		delete m_palDIB;
		m_palDIB = NULL;
	}
	if (m_hDIB == NULL)
	{
		return;
	}
	// Set up document size
	LPSTR lpDIB = (LPSTR) ::GlobalLock((HGLOBAL) m_hDIB);
	if (::DIBWidth(lpDIB) > INT_MAX ||::DIBHeight(lpDIB) > INT_MAX)
	{
		::GlobalUnlock((HGLOBAL) m_hDIB);
		::GlobalFree((HGLOBAL) m_hDIB);
		m_hDIB = NULL;
		CString strMsg;
		strMsg.LoadString(IDS_DIB_TOO_BIG);
		MessageBox(NULL, strMsg, NULL, MB_ICONINFORMATION | MB_OK);
		return;
	}
	m_sizeDoc = CSize((int) ::DIBWidth(lpDIB), (int) ::DIBHeight(lpDIB));
	::GlobalUnlock((HGLOBAL) m_hDIB);
	// Create copy of palette
	m_palDIB = new CPalette;
	if (m_palDIB == NULL)
	{
		// we must be really low on memory
		::GlobalFree((HGLOBAL) m_hDIB);
		m_hDIB = NULL;
		return;
	}
	if (::CreateDIBPalette(m_hDIB, m_palDIB) == NULL)
	{
		// DIB may not have a palette
		delete m_palDIB;
		m_palDIB = NULL;
		return;
	}
}

BOOL CDibDoc::OnOpenDocument(LPCTSTR lpszPathName)
{
	CFile file;
	CFileException fe;
	if (!file.Open(lpszPathName, CFile::modeRead | CFile::shareDenyWrite, &fe))
	{
		ReportSaveLoadException(lpszPathName, &fe,
			FALSE, AFX_IDP_FAILED_TO_OPEN_DOC);
		return FALSE;
	}

	DeleteContents();
	BeginWaitCursor();

	// replace calls to Serialize with ReadDIBFile function
	TRY
	{
		m_hDIB = ::ReadDIBFile(file);
	}
	CATCH (CFileException, eLoad)
	{
		file.Abort(); // will not throw an exception
		EndWaitCursor();
		ReportSaveLoadException(lpszPathName, eLoad,
			FALSE, AFX_IDP_FAILED_TO_OPEN_DOC);
		m_hDIB = NULL;
		return FALSE;
	}
	END_CATCH

	InitDIBData();
	EndWaitCursor();

	if (m_hDIB == NULL)
	{
		// may not be DIB format
		CString strMsg;
		strMsg.LoadString(IDS_CANNOT_LOAD_DIB);
		MessageBox(NULL, strMsg, NULL, MB_ICONINFORMATION | MB_OK);
		return FALSE;
	}
	SetPathName(lpszPathName);
	SetModifiedFlag(FALSE);     // start off with unmodified
	return TRUE;
}

BOOL CDibDoc::OnSaveDocument(LPCTSTR lpszPathName)
{
	CFile file;
	CFileException fe;

    
	if (!file.Open(lpszPathName, CFile::modeCreate |
	  CFile::modeReadWrite | CFile::shareExclusive, &fe))
	{
		ReportSaveLoadException(lpszPathName, &fe,
			TRUE, AFX_IDP_INVALID_FILENAME);
		return FALSE;
	}

	// replace calls to Serialize with SaveDIB function
	BOOL bSuccess = FALSE;
	TRY
	{
		BeginWaitCursor();
        LPSTR lpDIB = (LPSTR) ::GlobalLock((HGLOBAL) m_hDIB);
        GBData gbd(GetTitle());
        bSuccess = gbd.append_bitmap(GetTitle(), lpDIB);
        gbsave(gbd, file);
		file.Close();
	}
	CATCH (CException, eSave)
	{
		file.Abort(); // will not throw an exception
		EndWaitCursor();
		ReportSaveLoadException(lpszPathName, eSave,
			TRUE, AFX_IDP_FAILED_TO_SAVE_DOC);
		return FALSE;
	}
	END_CATCH

	EndWaitCursor();
	SetModifiedFlag(FALSE);     // back to unmodified

	if (!bSuccess)
	{
		// may be other-style DIB (load supported but not save)
		//  or other problem in SaveDIB
		CString strMsg;
		strMsg.LoadString(IDS_CANNOT_SAVE_DIB);
		MessageBox(NULL, strMsg, NULL, MB_ICONINFORMATION | MB_OK);
	}

	return bSuccess;
}

void CDibDoc::ReplaceHDIB(HDIB hDIB)
{
	if (m_hDIB != NULL)
	{
		::GlobalFree((HGLOBAL) m_hDIB);
	}
	m_hDIB = hDIB;
}

/////////////////////////////////////////////////////////////////////////////
// CDibDoc diagnostics

#ifdef _DEBUG
void CDibDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CDibDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}

#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CDibDoc commands
BOOL CDibDoc::DoSave(LPCTSTR lpszPathName, BOOL bReplace)
	// Save the document data to a file
	// lpszPathName = path name where to save document file
	// if lpszPathName is NULL then the user will be prompted (SaveAs)
	// note: lpszPathName can be different than 'm_strPathName'
	// if 'bReplace' is TRUE will change file name if successful (SaveAs)
	// if 'bReplace' is FALSE will not change path name (SaveCopyAs)
{
	CString newName = lpszPathName;
    bReplace = FALSE;
	if (newName.IsEmpty())
	{
		CDocTemplate* pTemplate = GetDocTemplate();
		ASSERT(pTemplate != NULL);

		newName = m_strPathName;
		if (bReplace && newName.IsEmpty())
		{
			newName = m_strTitle;
			// check for dubious filename
			int iBad = newName.FindOneOf(_T(":/\\"));
			if (iBad != -1)
				newName.ReleaseBuffer(iBad);

            /*
			// append the default suffix if there is one
			CString strExt;
			if (pTemplate->GetDocString(strExt, CDocTemplate::filterExt) &&
			  !strExt.IsEmpty())
			{
				ASSERT(strExt[0] == '.');
				int iStart = 0;
				newName += strExt.Tokenize(_T(";"), iStart);
			}
            */
            newName += ".c";
		}
        CFileDialog dlgFile(
            FALSE, // save
            "c",   // default extension
            m_strTitle, // filename
            OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT, 
            "*.c", // filters
            NULL, 
            0
        );
        if(! dlgFile.DoModal())
            return FALSE;
        newName = dlgFile.GetPathName();
	}
    return CDocument::DoSave(newName, bReplace);
}

BOOL CDibDoc::DoFileSave()
{
	DWORD dwAttrib = GetFileAttributes(m_strPathName);
	if (dwAttrib & FILE_ATTRIBUTE_READONLY)
	{
		// we do not have read-write access or the file does not (now) exist
		if (!DoSave(NULL))
		{
			TRACE(traceAppMsg, 0, "Warning: File save with new name failed.\n");
			return FALSE;
		}
	}
	else
	{
        if(!DoSave( m_strTitle + ".c" ))
		//if (!DoSave(m_strPathName))
		{
			TRACE(traceAppMsg, 0, "Warning: File save failed.\n");
			return FALSE;
		}
	}
	return TRUE;
}

CString CDibDoc::m_Group_Title;

BOOL CDibDoc::DoSaveAll(LPCTSTR lpszPathName, BOOL bReplace){

	CString newName = lpszPathName;
    bReplace = FALSE;
	if (newName.IsEmpty()){
        CFileDialog dlgFile(
            FALSE, // save
            "c",   // default extension
            m_strTitle, // filename
            OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT, 
            "*.c", // filters
            NULL, 
            0
        );
        if(! dlgFile.DoModal())
            return FALSE;
        newName = dlgFile.GetPathName();
        m_Group_Title = dlgFile.GetFileName();
        int i = m_Group_Title.ReverseFind('.');
        m_Group_Title.Delete(i, 4);
    }

    CDocTemplate * pDC = GetDocTemplate();
	POSITION pos = pDC->GetFirstDocPosition();
    GBData gbd(m_Group_Title);
	while (pos != NULL){
		CDibDoc * pDoc = (CDibDoc *)pDC->GetNextDoc(pos);
        LPSTR lpDIB = (LPSTR) ::GlobalLock((HGLOBAL) (pDoc->m_hDIB));
        gbd.append_bitmap(pDoc->GetTitle(), lpDIB);
	}

    CFile file;
	CFileException fe;

	if (!file.Open(newName, CFile::modeCreate |
	  CFile::modeReadWrite | CFile::shareExclusive, &fe))
	{
		ReportSaveLoadException(lpszPathName, &fe,
			TRUE, AFX_IDP_INVALID_FILENAME);
		return FALSE;
	}

    BeginWaitCursor();
	BOOL bSuccess = FALSE;
	TRY {
        gbsave(gbd, file);
        file.Close();
	    bSuccess = TRUE;
	}
    CATCH (CException, eSave){
		file.Abort(); // will not throw an exception
		ReportSaveLoadException(lpszPathName, eSave,
			TRUE, AFX_IDP_FAILED_TO_SAVE_DOC);
		bSuccess = FALSE;
	}
	EndWaitCursor();
	END_CATCH
    return bSuccess;
}

void CDibDoc::OnFileSaveAll()
{
    DoSaveAll(m_Group_Title + ".c", TRUE);
}

void CDibDoc::OnUpdateFileSaveAll(CCmdUI *pCmdUI)
{
    // TODO: Add your command update UI handler code here
    pCmdUI->Enable(! m_Group_Title.IsEmpty() );
}

void CDibDoc::OnFileSaveAllAs()
{
    DoSaveAll(NULL, TRUE);
}

void CDibDoc::OnUpdateFileSaveAllAs(CCmdUI *pCmdUI)
{
    // TODO: Add your command update UI handler code here
    pCmdUI->Enable();
}
