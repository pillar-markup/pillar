visiting
visitFigure: aFigure
	"http://spec.commonmark.org/0.28/#images"

	canvas raw: '!['.
	aFigure hasLabel ifTrue: [ canvas raw: aFigure label ].
	canvas raw: '](' , aFigure localFileOrExternalReference.
	aFigure hasCaption ifTrue: [ canvas raw: ' "' , aFigure text , '"' ].
	canvas raw: ')'