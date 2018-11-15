visiting
visitHeader: aHeader

	| templateFile |
	templateFile := outputDocument templateDirectory / 'header.mustache'.
	templateFile exists
		ifTrue: [ | subWriter level contents result |
			subWriter := outputDocument writer.
			subWriter visitDocumentGroup: aHeader.
			level := aHeader level min: 7 max: 1.
			
			contents := subWriter contents.
			result := templateFile asMustacheTemplate value: {
				'level' -> level.
				'contents' -> contents } asDictionary.
			self visitRaw: (PRRaw content: result type: defaultWriter writerName) ]
		ifFalse: [ defaultWriter visitHeader: aHeader ].