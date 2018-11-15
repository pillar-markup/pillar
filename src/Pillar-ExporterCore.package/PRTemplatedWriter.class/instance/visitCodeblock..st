visiting
visitCodeblock: aPRCodeblock 

	self
		writeRawText: aPRCodeblock text
		withTemplateFileName: self codeBlockTemplateFileName
		extraArguments: { 'language' -> (defaultWriter languageForScript: aPRCodeblock) }
		ifAbsent: [ defaultWriter visitCodeblock: aPRCodeblock ]