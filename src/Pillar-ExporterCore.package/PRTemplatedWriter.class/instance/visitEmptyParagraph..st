visiting
visitEmptyParagraph: anEmptyParagraph
	
	self
		writeRawText: anEmptyParagraph text
		withTemplateFileName: self emptyParagraphTemplateFileName
		ifAbsent: [ defaultWriter visitEmptyParagraph: anEmptyParagraph ]