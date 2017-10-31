private
errorFileNotFound: aFile
	PRInputFileError signal: 'File at: ' , aFile fullName , ' not found.'