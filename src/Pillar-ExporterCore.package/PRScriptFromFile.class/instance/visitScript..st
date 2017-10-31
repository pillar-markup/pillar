visiting-document
visitScript: aScript
	(self hasFromFile: aScript)
		ifTrue: [ self replace: {(self addScript: aScript)} ]