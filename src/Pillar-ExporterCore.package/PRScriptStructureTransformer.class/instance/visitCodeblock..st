visiting-document
visitCodeblock: aCodeBlock
	aCodeBlock isStructure
		ifTrue: [ self replace: (OrderedCollection with: (self createStructureFrom: aCodeBlock)) ]