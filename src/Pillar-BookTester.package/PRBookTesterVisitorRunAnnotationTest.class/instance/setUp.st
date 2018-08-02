running
setUp
	"Hooks that subclasses may override to define the fixture of test."
	
	super setUp.
	"PRBookTestDummyRunAnnotation methodDict removeAll."
	testingFileSystem := FileSystem memory workingDirectory.
	(testingFileSystem / self class pillarFileNameForTest)
		writeStreamDo: [ :stream |
			stream nextPutAll: self class pillarContentsForTest ].
