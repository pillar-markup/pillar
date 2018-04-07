printing
printOn: aStream

	super printOn: aStream.
	aStream nextPutAll: 'level:'; 
		nextPutAll: self level asString.
	aStream nextPutAll: ' autoAnchor:'; 
		nextPutAll: self autoAnchor asString.