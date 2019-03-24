//  gbfile.cpp
//
//  Source file to write gb code files:
//
//  gbsave()           - Saves the specified dib in a file

#include "stdafx.h"
#include "gbformat.h"
#include <string>
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
