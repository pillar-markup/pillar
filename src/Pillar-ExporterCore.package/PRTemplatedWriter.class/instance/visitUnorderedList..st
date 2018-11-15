visiting
visitUnorderedList: aPRUnorderedList 

	| templateFile |
	templateFile := outputDocument templateDirectory / 'unorderedList.mustache'.
	templateFile exists
		ifTrue: [ | subWriter contents result |
			subWriter := outputDocument writer.
			subWriter visitDocumentGroup: aPRUnorderedList.
			
			contents := subWriter contents.
			result := templateFile asMustacheTemplate value: {
				'contents' -> contents } asDictionary.
			self visitRaw: (PRRaw content: result type: defaultWriter writerName) ]
		ifFalse: [ defaultWriter visitUnorderedList: aPRUnorderedList ].