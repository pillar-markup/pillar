visiting-document
visitCodeblock: aCodeBlock
	aCodeBlock isEvaluated
		ifTrue: [ self replace: aCodeBlock evaluate ]