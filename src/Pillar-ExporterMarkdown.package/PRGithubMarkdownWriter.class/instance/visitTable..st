visiting-document
visitTable: aTableCell
	firstRow := true.
	self visitDocumentGroup: aTableCell.
	canvas newLine.