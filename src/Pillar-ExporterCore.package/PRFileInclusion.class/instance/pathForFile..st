protected
pathForFile: aFile
	^ (aFile copyReplaceAll: self configuration baseDirectory fullName with: FileSystem disk delimiter asString) copyReplaceAll: '//' with: ''  