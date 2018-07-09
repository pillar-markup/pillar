running
setUp

	super setUp.
	testingFileSystem := FileSystem memory workingDirectory.
	(testingFileSystem / PRTransformerEnvironmentTest pillarFileNameForTest)
		writeStreamDo: [ :stream | 
			stream nextPutAll: PRTransformerEnvironmentTest pillarContentsForTest ]