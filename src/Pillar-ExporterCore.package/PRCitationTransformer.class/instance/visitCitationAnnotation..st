visiting-annotations
visitCitationAnnotation: aCitationAnnotation

	self replace: (OrderedCollection with: (self createNewCitationWith: aCitationAnnotation)).
	super visitCitationAnnotation: aCitationAnnotation 