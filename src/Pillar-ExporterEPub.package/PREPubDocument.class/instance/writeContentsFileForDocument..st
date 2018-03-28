writing
writeContentsFileForDocument: aDocument

	self
		writeDocument: aDocument
		inFile: (self epubContentsGenerationDirectory / 'contents.xhtml')
		withWriter: PRXHTMLWriter new