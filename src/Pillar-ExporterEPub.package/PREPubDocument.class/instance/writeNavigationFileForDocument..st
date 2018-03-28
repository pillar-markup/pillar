writing
writeNavigationFileForDocument: aDocument

	self
		writeDocument: aDocument
		inFile: (self epubContentsGenerationDirectory / 'navigation.xhtml')
		withWriter: PREPubNavigationMenuWriter new