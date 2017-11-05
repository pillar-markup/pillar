visiting-document
visitTableRow: aRow
	canvas tag
		name: 'tr';
		with: [ super visitTableRow: aRow ].
	canvas newLine