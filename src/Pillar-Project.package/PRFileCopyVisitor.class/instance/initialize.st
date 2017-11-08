accessing
initialize
	super initialize.
	conflictResolutionBlock := [ :sourceFile :targetFile | sourceFile copyTo: targetFile ]