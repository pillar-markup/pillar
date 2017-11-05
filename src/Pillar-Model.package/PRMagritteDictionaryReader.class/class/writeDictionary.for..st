instance creation
writeDictionary: aCollection for: anAnnotationClass
	^ self new
		class: anAnnotationClass;
		write: aCollection