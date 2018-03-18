visiting-document
visitCodeblock: aCodeBlock
	(aCodeBlock isHideable)
		ifTrue: [ self delete ]