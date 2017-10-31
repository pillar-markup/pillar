visiting-document
visitScript: aScript
	aScript hasLabel
		ifTrue: [ anchorMapping at: aScript label put: currentSlide ].
	super visitScript: aScript