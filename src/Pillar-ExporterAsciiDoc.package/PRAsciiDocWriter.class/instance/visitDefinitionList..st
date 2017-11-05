visiting-document
visitDefinitionList: anObject
	canvas potentialNewLine.
	self nest: '' do: [ super visitDefinitionList: anObject ]