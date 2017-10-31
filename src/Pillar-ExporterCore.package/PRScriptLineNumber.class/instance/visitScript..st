visiting-document
visitScript: aScript
	(self hasLineNumber: aScript)
		ifTrue: [ self replace: {self addLineNumberTo: aScript} ]