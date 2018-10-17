running
setUp
	"Hooks that subclasses may override to define the fixture of test."
	
	super setUp.
	PRBookTestDummyRunAnnotation methods do: [ :each | each removeFromSystem ].
	testingFileSystem := FileSystem memory workingDirectory.
	(testingFileSystem / self class pillarFileNameForTest)
		writeStreamDo: [ :stream |
			stream nextPutAll: self class pillarContentsForTest ].
