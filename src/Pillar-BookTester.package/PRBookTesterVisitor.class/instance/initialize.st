initialization
initialize

	super initialize.
	allTestResults := OrderedCollection new.
	checkAll := false.
	workingDirectory := FileLocator home.
