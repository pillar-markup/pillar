running
setUp
	super setUp.
	directory := FileSystem workingDirectory.
	self createFile1.
	self createFile2.
	self createFile3.
	self createFile4