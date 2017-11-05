visiting-document
visitAnnotatedParagraph: anObject
	canvas 
		raw: (self markupFor: anObject);
		nextPutAll: anObject annotation.
	anObject hasChildren 
		ifTrue: [ canvas space ].
	super visitAnnotatedParagraph: anObject