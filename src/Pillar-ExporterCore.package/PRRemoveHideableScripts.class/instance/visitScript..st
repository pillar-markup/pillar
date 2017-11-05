visiting-document
visitScript: aScript
	(aScript isHideable)
		ifTrue: [ self delete ]