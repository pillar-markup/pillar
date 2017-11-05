visiting-document
visitFigure: aFigure
	canvas raw: '!['.
	aFigure hasLabel ifTrue: [ canvas raw: aFigure label ].
	canvas raw: '](', aFigure localFileOrExternalReference.
	aFigure hasCaption ifTrue: [ canvas raw: ' "', aFigure text, '"' ].
	canvas raw: ')'.