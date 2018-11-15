visiting
visitListItem: aPRListItem

	| templateFile |
	templateFile := outputDocument templateDirectory / 'listItem.mustache'.
	templateFile exists
		ifTrue: [ self halt ]
		ifFalse: [ defaultWriter visitListItem: aPRListItem ].