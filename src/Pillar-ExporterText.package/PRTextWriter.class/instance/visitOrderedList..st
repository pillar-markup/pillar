visiting-document
visitOrderedList: anObject
	canvas potentialNewLine.
	self nest: 0 do: [ super visitOrderedList: anObject ]