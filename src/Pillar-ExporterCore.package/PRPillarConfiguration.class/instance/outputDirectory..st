accessing
outputDirectory: aDirectory
	"Set the directory where to output with non-absolute path or a Directory as FileReference."
	(aDirectory isDirectory or: [ aDirectory exists not ]) 
		ifFalse: [ Error signal: aDirectory, ' is not a directory' ].
	self 
		propertyAt: 'outputDirectory' 
		put: aDirectory