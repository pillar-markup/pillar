accessing
annotationStrategy
	^ self 
			propertyAt: self class annotationStrategy 
			ifAbsentPut: [ PRErrorShoutStrategy new ]