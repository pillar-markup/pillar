as yet unclassified
annotationStrategy
	^ self 
			propertyAt: self class annotationStrategy 
			ifAbsentPut: [ PRErrorShoutStrategy new ]