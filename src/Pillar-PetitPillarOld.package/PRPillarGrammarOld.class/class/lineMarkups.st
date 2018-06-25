accessing
lineMarkups
	| markups |
	markups := Dictionary new.
	markups
		at: PRAnchor put: '@';
		at: PRHeader put: '!';
		at: PROrderedList put: '#';
		at: PRUnorderedList put: '-';
		at: PRDataItem put: ':';
		at: PRTermItem put: ';';
		at: PRAnnotatedParagraph put: '@@';
		at: PRPreformatted put: '= ';
		at: PRHorizontalRule put: '_';
		at: PRCommentedLine put: '%';
		at: PRTableCell put: '|'.
	^ markups