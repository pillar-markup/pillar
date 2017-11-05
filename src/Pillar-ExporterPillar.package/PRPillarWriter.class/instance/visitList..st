visiting-document
visitList: aList
	canvas potentialNewLine.
	self nest: (self markupFor: aList) do: [ super visitList: aList ]