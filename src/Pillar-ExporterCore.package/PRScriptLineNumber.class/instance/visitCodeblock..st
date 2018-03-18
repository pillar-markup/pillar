visiting-document
visitCodeblock: aScript
	(self hasLineNumber: aScript)
		ifTrue: [ self replace: {self addLineNumberTo: aScript} ]