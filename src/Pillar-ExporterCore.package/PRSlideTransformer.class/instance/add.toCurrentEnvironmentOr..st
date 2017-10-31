protected
add: anObject toCurrentEnvironmentOr: aBlock
	^ currentSlide
		ifNil: [ aBlock value ]
		ifNotNil: [ self delete.
			currentSlide add: anObject ]