private
extraArguments
	| arguments |
	arguments := super extraArguments.
	self optionAt: 'to' ifPresent: [ :to | arguments copyWith: 'defaultExporters' -> {to} ].
	^ arguments