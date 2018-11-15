visiting
visitMonospaceFormat: aPRMonospaceFormat 
	
	| templateFile |
	templateFile := outputDocument templateDirectory / self monospaceTemplateFileName.
	templateFile exists
		ifTrue: [ | subWriter contents result |
			subWriter := outputDocument writer.
			subWriter visitDocumentGroup: aPRMonospaceFormat.
			
			contents := subWriter contents.
			result := templateFile asMustacheTemplate value: {
				'contents' -> contents } asDictionary.
			self visitRaw: (PRRaw content: result type: defaultWriter writerName) ]
		ifFalse: [ defaultWriter visitMonospaceFormat: aPRMonospaceFormat ].