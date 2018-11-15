visiting
visitEmptyParagraph: anEmptyParagraph
	
	| templateFile |
	templateFile := outputDocument templateDirectory / self emptyParagraphTemplateFileName.
	templateFile exists
		ifTrue: [ | result |
			result := templateFile asMustacheTemplate value: { 'contents' -> anEmptyParagraph text } asDictionary.
			self visitRaw: (PRRaw content: result type: defaultWriter writerName) ]
		ifFalse: [ defaultWriter visitEmptyParagraph: anEmptyParagraph ].