visiting-document
visitOrderedList: anObject
	canvas newLine.
	self nest: '.' do: [ super visitOrderedList: anObject ]