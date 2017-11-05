instance creation
write: anAnnotation
	| descriptions |
	annotation := anAnnotation.
	stream
		nextPutAll: (PRPillarParser markups at: PRAbstractAnnotation);
		nextPutAll: anAnnotation class tag.
	anAnnotation hasParameters
		ifTrue:
			[ stream nextPut: PRPillarParser defaultMarkupAnnotationSeparator ].
	descriptions := self sortedDescriptionsFor: anAnnotation.
	self visitAll: descriptions.
	stream
		nextPutAll: (PRPillarParser endMarkups at: PRAbstractAnnotation).
	^ stream contents