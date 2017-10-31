visiting-document
visitAnchor: anObject
	canvas
		raw: (self markupFor: anObject);
		nextPutAll: anObject name;
		newLine