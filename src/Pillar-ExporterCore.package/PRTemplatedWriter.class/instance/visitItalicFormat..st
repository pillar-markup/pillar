visiting
visitItalicFormat: aPRItalicFormat 
	
	self
		write: aPRItalicFormat
		withTemplateFileName: self italicTemplateFileName
		ifAbsent: [ defaultWriter visitItalicFormat: aPRItalicFormat ]