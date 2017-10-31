visiting-document
visitListItem: anItem
	canvas command name: 'item'.
	canvas space.
	canvas raw: [ super visitListItem: anItem ].
	canvas newLine