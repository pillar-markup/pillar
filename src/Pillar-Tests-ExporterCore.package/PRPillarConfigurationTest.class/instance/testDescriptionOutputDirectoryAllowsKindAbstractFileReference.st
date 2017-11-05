tests
testDescriptionOutputDirectoryAllowsKindAbstractFileReference
	self shouldnt: 
		[ self configurationClass new outputDirectory: FileLocator imageDirectory ]
		raise: Error.
	self shouldnt:
		[ self configurationClass  new outputDirectory: FileLocator imageDirectory asFileReference ]
		raise: Error