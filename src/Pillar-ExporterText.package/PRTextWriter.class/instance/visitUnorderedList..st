visiting-document
visitUnorderedList: anObject
	canvas potentialNewLine.
	self nest: '*' do: [ super visitUnorderedList: anObject ]