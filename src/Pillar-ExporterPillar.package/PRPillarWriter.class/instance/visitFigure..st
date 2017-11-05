visiting-document
visitFigure: aFigure
	canvas raw: (self markupFor: aFigure).
	super visitFigure: aFigure.
	canvas raw: (self markupFor: aFigure)