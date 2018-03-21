printing
printOn: aStream
	"super printOn: aStream.
	aStream nextPutAll: ' ('."
	"do not change this printOn: method because it is used (yes this is not a good idea) for the 
	latex code generation directly...."
	aStream nextPutAll: self originalName.
	"aStream nextPutAll: ')'."