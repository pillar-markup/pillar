visiting-document
visitTableRow: aTableRow

	stream << '| '.
	self visitAll: aTableRow children separatedBy: [ stream << ' | ' ].
	firstRow ifTrue: [ 
		stream newLine.
		firstRow := false.
		
		aTableRow children do: [ :aTableCell | 
			stream << '| '.	
				aTableCell isAligned 
					ifTrue: [
						aTableCell isAlignedLeft ifTrue: [ stream << ':---' ].
						aTableCell isAlignedCenter ifTrue: [ stream << ':---:' ].
						aTableCell isAlignedRight ifTrue: [ stream << '---:' ] ]
					ifFalse: [ stream << ':---:' ] ] ].
	stream newLine