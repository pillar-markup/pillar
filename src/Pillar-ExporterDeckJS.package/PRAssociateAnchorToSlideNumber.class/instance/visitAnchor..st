visiting-document
visitAnchor: anObject
	anchorMapping at: anObject name put: currentSlide.
	super visitAnchor: anObject