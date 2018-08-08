running
setUp

	super setUp.
	testingFileSystem := FileSystem memory workingDirectory.
	(testingFileSystem / PRTransformerEnvironmentTest pillarAnnotationsFileNameForTest)
		writeStreamDo: [ :stream | 
			stream nextPutAll: PRTransformerEnvironmentTest pillarAnnotationsContentsForTest ].
	((FileLocator image / 'figures') isFile)
		ifFalse: [ (FileLocator imageDirectory / 'figures') ensureCreateDirectory ]