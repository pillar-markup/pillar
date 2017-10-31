visiting-document
visitScript: aScript
	aScript hasCaption | aScript hasLabel
		ifTrue: [ self visitFloatingScript: aScript ]
		ifFalse: [ self visitInFlowScript: aScript ]