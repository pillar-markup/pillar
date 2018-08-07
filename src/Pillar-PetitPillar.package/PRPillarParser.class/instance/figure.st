grammar - Reference
figure
	^ super figure ==> [ :array | 
			| fig |
			fig := PRFigure reference: array fourth.
			fig addAll: (array third ifNil: [ {} ]).
			fig parameters: (array fifth ifNil: [ OrderedDictionary new ]).
			fig start: array first start; stop: array last stop.
			fig ]