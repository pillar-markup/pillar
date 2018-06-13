private
setUp
	
	| workingDirectory |
	super setUp.
	testingFileSystem := FileSystem memory workingDirectory.
	workingDirectory := (testingFileSystem / PRDocListTransformerTest directoryNameForTest) ensureCreateDirectory.
	self createFilesIn: workingDirectory.