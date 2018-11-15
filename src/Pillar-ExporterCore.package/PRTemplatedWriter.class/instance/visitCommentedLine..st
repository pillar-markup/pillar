visiting
visitCommentedLine: aPRText 

	self
		writeRawText: aPRText text
		withTemplateFileName: self commentedLineTemplateFileName
		ifAbsent: [ defaultWriter visitCommentedLine: aPRText  ]