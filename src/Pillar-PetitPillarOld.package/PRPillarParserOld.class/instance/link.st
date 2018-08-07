grammar - Reference
link
	^ super link
		==>
			[ :array | 
			| linkRes |
			linkRes := PRLink fromReference: array third.
			array second ifNotNil: [ :aliasChildren | linkRes addAll: aliasChildren ].
			linkRes parameters: (array fourth ifNil: [ OrderedDictionary new ]).
			linkRes ]