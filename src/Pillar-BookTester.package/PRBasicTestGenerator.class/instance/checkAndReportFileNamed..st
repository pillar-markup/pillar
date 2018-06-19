visiting
checkAndReportFileNamed: aPath
	
	self fileName: (self prettyRename: aPath).
	self createClassFrom: fileName.
	super checkAndReportFileNamed: aPath.
	
		