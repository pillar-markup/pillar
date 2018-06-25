grammar - Reference
link
	^ super link
		==>
			[ :array | 
			| linkRes |
			linkRes := PRLink fromReference: array fourth.
			array third ifNotNil: [ :aliasChildren | linkRes addAll: aliasChildren ].
			linkRes parameters: (array fifth ifNil: [ OrderedDictionary new ]).
			linkRes start: array first start; stop: array last stop.
			linkRes ]