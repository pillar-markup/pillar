visiting-document
visitDocumentGroup: aGroup
	occurenceOfHeader ifNil: [ self initOccurenceOfAnchor: aGroup ].
	aGroup
		setChildren:
			(aGroup children
				flatCollect: [ :child | 
					"if child is a PRHeader and the configuration's parameter autoAnchor is true"
					((child class = PRHeader) and: [ ((self configuration levelConfigurationFor: child ) autoAnchor ) ])
						ifTrue: [ self addAnchorOf: child ]
						ifFalse: [ 
							replacement push: {child}.
							self visit: child.
							replacement pop ] ])