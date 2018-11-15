visiting
visitItalicFormat: aPRItalicFormat 
	
	| templateFile |
	templateFile := outputDocument templateDirectory / self italicTemplateFileName.
	templateFile exists
		ifTrue: [ | subWriter contents result |
			subWriter := outputDocument writer.
			subWriter visitDocumentGroup: aPRItalicFormat.
			
			contents := subWriter contents.
			result := templateFile asMustacheTemplate value: {
				'contents' -> contents } asDictionary.
			self visitRaw: (PRRaw content: result type: defaultWriter writerName) ]
		ifFalse: [ defaultWriter visitItalicFormat: aPRItalicFormat ].