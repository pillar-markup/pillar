visiting
visitParagraph: aParagraph

	self
		write: aParagraph
		withTemplateFileName: self paragraphTemplateFileName
		ifAbsent: [ defaultWriter visitParagraph: aParagraph ]