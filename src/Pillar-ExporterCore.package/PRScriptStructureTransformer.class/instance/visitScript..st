visiting-document
visitScript: aScript
	aScript isStructure
		ifTrue: [ self replace: (OrderedCollection with: (self createStructureFrom: aScript)) ]