visiting
visitHorizontalRule: aPRHorizontalRule

	self
		writeRawText: ''
		withTemplateFileName: self horizontalRuleTemplateFileName
		ifAbsent: [ defaultWriter visitHorizontalRule: aPRHorizontalRule ]