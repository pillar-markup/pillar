visiting-document
visitDocumentGroup: aGroup
	aGroup
		setChildren:
			(aGroup children
				flatCollect: [ :child | 
					replacement push: {child}.
					self visit: child.
					replacement pop]). 