visiting
visitParagraph: aParagraph
	
	| templateFile |
	templateFile := outputDocument templateDirectory / self paragraphTemplateFileName.
	templateFile exists
		ifTrue: [ | subWriter contents result |
			subWriter := outputDocument writer.
			subWriter visitDocumentGroup: aParagraph.
			
			contents := subWriter contents.
			result := templateFile asMustacheTemplate value: {
				'contents' -> contents } asDictionary.
			self visitRaw: (PRRaw content: result type: defaultWriter writerName) ]
		ifFalse: [ defaultWriter writeParagraphDuring: [ self visitDocumentGroup: aParagraph ] ].