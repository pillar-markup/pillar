visiting-document
writeTableConfiguration: aTableRow
	stream newLine.
	firstRow := false.
	canvas raw: '| '.
	aTableRow children
		do: [ :aTableCell | self writeTableColumnAlignment: aTableCell ]
		separatedBy: [ canvas raw: ' | ' ].
	canvas raw: ' |'