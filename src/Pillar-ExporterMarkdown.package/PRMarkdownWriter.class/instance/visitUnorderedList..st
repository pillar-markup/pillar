visiting-document
visitUnorderedList: aList
	canvas potentialNewLine.
	self nest: '-' do: [ self visitDocumentGroup: aList ]