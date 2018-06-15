as yet unclassified
checkRepository: aDirectory
	(workingDirectory resolve: aDirectory) exists
	ifFalse: [ self errorDirectoryNotFound: (workingDirectory resolve: aDirectory) ]