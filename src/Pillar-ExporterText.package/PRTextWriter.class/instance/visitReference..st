visiting-document
visitReference: anObject
	anObject hasAlias
		ifTrue: [ super visitReference: anObject ]
		ifFalse: [ canvas nextPutAll: anObject title ]