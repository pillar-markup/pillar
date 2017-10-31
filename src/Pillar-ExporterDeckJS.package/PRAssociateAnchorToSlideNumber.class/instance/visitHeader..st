visiting-document
visitHeader: aHeader
	"If we create a slide when we have a header in DeckJS we need to increase the counter."

	self configuration renderStructureAsSlide
		ifTrue: [ currentSlide := currentSlide + 1 ].
	super visitHeader: aHeader