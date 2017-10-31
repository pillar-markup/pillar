visiting-document
visitListItem: anItem
	canvas tag
		name: 'li';
		with: [ super visitListItem: anItem ].
	canvas newLine