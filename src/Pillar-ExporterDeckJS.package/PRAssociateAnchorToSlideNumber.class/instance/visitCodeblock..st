visiting-document
visitCodeblock: aCodeBlock
	aCodeBlock hasLabel
		ifTrue: [ anchorMapping at: aCodeBlock label put: currentSlide ].
	super visitCodeblock: aCodeBlock