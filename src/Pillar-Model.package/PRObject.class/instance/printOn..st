printing
printOn: aStream
	<ignoreForCoverage>
	super printOn: aStream.
	aStream nextPut: $[; print: self identityHash; nextPut: $]