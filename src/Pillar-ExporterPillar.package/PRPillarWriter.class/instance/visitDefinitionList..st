visiting-document
visitDefinitionList: anObject
	canvas potentialNewLine.
	anObject children do: [ :each |
		self 
			nest: (self markupFor: each)
			do: [ self visit: each ] ]