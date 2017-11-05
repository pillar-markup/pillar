visiting-document
visitTable: aTable

	canvas surround: [super visitTable: aTable] with: '|==='.
	canvas newLine.
