visiting
visitDefinitionList: aPRList

	self
		write: aPRList
		withTemplateFileName: self definitionListTemplateFileName
		ifAbsent: [ defaultWriter visitDefinitionList: aPRList ]