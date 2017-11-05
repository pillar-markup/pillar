visiting-document
visitScript: aScript
	aScript isEvaluated
		ifTrue: [ self replace: aScript evaluate ]