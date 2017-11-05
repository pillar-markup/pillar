visiting-document
visitSlide: aSlide
	currentSlide := currentSlide + 1.
	aSlide hasLabel
		ifTrue: [ anchorMapping at: aSlide label put: currentSlide ].
	super visitSlide: aSlide