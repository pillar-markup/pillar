tests
testDescriptionOutputDirectoryAllowsDirsOnly
	
	| directory |
	directory := FileLocator imageDirectory.
	self shouldnt: [ self configurationClass new outputDirectory: directory ] raise: Error.
	directory := Smalltalk imageFile.
	self should: [ self configurationClass new outputDirectory: directory ] raise: Error.