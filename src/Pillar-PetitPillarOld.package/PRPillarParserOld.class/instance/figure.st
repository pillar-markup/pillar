grammar - Reference
figure
	^ super figure
		==>
			[ :array | 
			| fig |
			fig := PRFigure reference: array third.
			fig addAll: (array second ifNil: [ {} ]).
			fig parameters: (array fourth ifNil: [ OrderedDictionary new ]).
			fig ]