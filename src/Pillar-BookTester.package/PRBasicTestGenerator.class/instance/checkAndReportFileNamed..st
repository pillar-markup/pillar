visiting
checkAndReportFileNamed: aPath

	self fileName: aPath asFileReference basename.
	self createClassFrom: fileName.
	super checkAndReportFileNamed: aPath.
	
		