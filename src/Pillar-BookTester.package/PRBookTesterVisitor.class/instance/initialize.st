initialization
initialize

	super initialize.
	allTestResults := OrderedCollection new.
	checkAll := false.
	workingDirectory := FileSystem disk workingDirectory.
