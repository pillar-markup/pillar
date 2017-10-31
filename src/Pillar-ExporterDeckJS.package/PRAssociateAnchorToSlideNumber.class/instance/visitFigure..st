visiting-document
visitFigure: anObject
	anObject hasLabel
		ifTrue: [ anchorMapping at: anObject label put: currentSlide ].
	super visitFigure: anObject