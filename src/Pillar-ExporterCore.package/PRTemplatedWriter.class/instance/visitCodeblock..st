visiting
visitCodeblock: aPRCodeblock 
	
	| templateFile |
	templateFile := outputDocument templateDirectory / self codeBlockTemplateFileName.
	templateFile exists
		ifTrue: [ | result |
			result := templateFile asMustacheTemplate value: {
				'language' -> (defaultWriter languageForScript: aPRCodeblock).
				'contents' -> aPRCodeblock text } asDictionary.
			self visitRaw: (PRRaw content: result type: defaultWriter writerName) ]
		ifFalse: [ defaultWriter visitCodeblock: aPRCodeblock ].