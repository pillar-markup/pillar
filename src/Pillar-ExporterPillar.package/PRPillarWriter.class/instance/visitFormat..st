visiting-document
visitFormat: anObject
	canvas raw: (self markupFor: anObject).
	super visitFormat: anObject.
	canvas raw: (self markupFor: anObject)