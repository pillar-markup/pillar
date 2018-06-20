private
setUp
	
	| workingDirectory |
	super setUp.
	testingFileSystem := FileSystem memory workingDirectory.
	workingDirectory := (testingFileSystem / PRDocumentListTransformerTest directoryNameForTest) ensureCreateDirectory.
	self createFilesIn: workingDirectory.