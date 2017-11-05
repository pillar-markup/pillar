visiting-annotations
visitCitationAnnotation: aCitationAnnotation

	self createNewCitationWith: aCitationAnnotation.
	self replace: (OrderedCollection with: tmpCitation) .
	super visitCitationAnnotation: aCitationAnnotation 