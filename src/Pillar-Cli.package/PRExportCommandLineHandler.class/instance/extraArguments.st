private
extraArguments
	| arguments |
	arguments := super extraArguments copy.

	arguments := self optionAt: 'to' ifPresent: [ :to | 
		arguments at: 'defaultExporters' put: {to} ].
	
	arguments
		at: 'inputFile' 
		ifAbsentPut: [ self arguments last ].

	^ arguments