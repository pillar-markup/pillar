visiting-document
visitListItem: aListItem
	nesting do: [ :each | canvas raw: each ].
	super visitListItem: aListItem.
	canvas potentialNewLine.