helpers
writeTableCellContent: aCell
	^ aCell isHeading
		ifTrue: [ 
			canvas command
				name: 'textbf';
				parameter: [ super visitTableCell: aCell ] ]
		ifFalse: [ super visitTableCell: aCell ]