visiting
visitListItem: aPRListItem

	| templateFile |
	templateFile := outputDocument templateDirectory / self listItemTemplateFileName.
	templateFile exists
		ifTrue: [  | subWriter contents result |
			subWriter := outputDocument writer.
			subWriter visitDocumentGroup: aPRListItem.
			
			contents := subWriter contents.
			result := templateFile asMustacheTemplate value: {
				'contents' -> contents } asDictionary.
			self visitRaw: (PRRaw content: result type: defaultWriter writerName)  ]
		ifFalse: [ defaultWriter visitListItem: aPRListItem ].