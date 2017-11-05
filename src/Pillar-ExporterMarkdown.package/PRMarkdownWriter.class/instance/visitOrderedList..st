visiting-document
visitOrderedList: aList
	canvas potentialNewLine.
	self nest: '1.' do: [ self visitDocumentGroup: aList ]