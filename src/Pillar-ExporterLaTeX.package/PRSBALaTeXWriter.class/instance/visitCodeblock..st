visiting-document
visitCodeblock: aCodeBlock
	aCodeBlock hasCaption | aCodeBlock hasLabel
		ifTrue: [ self visitFloatingScript: aCodeBlock ]
		ifFalse: [ self visitInFlowScript: aCodeBlock ]