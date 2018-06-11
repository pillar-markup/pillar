running
setUp
	"Hooks that subclasses may override to define the fixture of test."
	| testingFileSystem |
	super setUp.
	testingFileSystem := FileSystem memory workingDirectory.
	(testingFileSystem / self class bibFileNameForTest)
		writeStreamDo: [ :stream |
			stream nextPutAll: self class bibContentsForTest ]