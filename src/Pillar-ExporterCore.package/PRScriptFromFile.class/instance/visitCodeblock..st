visiting-document
visitCodeblock: aCodeBlock
	(self hasFromFile: aCodeBlock)
		ifTrue: [ self replace: {(self addScript: aCodeBlock)} ]