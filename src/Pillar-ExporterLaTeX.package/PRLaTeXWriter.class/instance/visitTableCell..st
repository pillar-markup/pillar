visiting-document
visitTableCell: aCell
	aCell isAligned
		ifFalse: [ self writeTableCellContent: aCell ]
		ifTrue: [ 
			canvas command
				name: 'multicolumn';
				parameter: '1';
				parameter: aCell latexAlignment;
				parameter: [ self writeTableCellContent: aCell ] ]