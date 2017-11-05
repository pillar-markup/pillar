tests
testDescriptionOutputDirectoryAcceptsNotYetCreatedDirectories
	
	| directory |
	directory := FileLocator imageDirectory / UUID new printString.
	self deny: directory exists.
	self shouldnt: [  self configurationClass  new outputDirectory: directory ] raise: Error.
