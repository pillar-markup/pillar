visiting
visitBoldFormat: aPRBoldFormat

	| templateFile |
	templateFile := outputDocument templateDirectory / 'bold.mustache'.
	templateFile exists
		ifTrue: [ | subWriter contents result |
			subWriter := outputDocument writer.
			subWriter visitDocumentGroup: aPRBoldFormat.
			
			contents := subWriter contents.
			result := templateFile asMustacheTemplate value: {
				'contents' -> contents } asDictionary.
			self visitRaw: (PRRaw content: result type: defaultWriter writerName) ]
		ifFalse: [ defaultWriter visitBoldFormat: aPRBoldFormat ].