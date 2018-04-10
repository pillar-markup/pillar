action
generateDocumentationOf: transformers
	transformers
		do: [ :transformer | 
			stream
				nextPutAll: ';==';
				nextPutAll: transformer class printString;
				nextPutAll: '==';
				nextPutAll: Smalltalk os lineEnding;
				nextPutAll: ':';
				nextPutAll: transformer comment;
				nextPutAll: Smalltalk os lineEnding ]