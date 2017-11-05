visiting-document
visitTableCell: aCell

	canvas precede: [ super visitTableCell: aCell ] by: '|'.
	aCell isHeading 
		ifFalse: [canvas newLine].