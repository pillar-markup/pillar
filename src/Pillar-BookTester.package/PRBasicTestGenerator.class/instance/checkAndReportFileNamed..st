visiting
checkAndReportFileNamed: aPath
	
	| path |
	path := aPath asFileReference.
	self fileName: (self prettyRename: path).
	self createClassFrom: fileName.
	super checkAndReportFileNamed: aPath.
	
		