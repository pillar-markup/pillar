accessing
baseDirectory
	^ baseDirectory ifNil: [ FileSystem workingDirectory ]