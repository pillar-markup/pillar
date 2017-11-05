private
argumentsForConfigurationExtension
	| arguments |
	arguments := super argumentsForConfigurationExtension.
	self optionAt: 'to'
		ifPresent: [ :to | arguments at: 'defaultExporters' put: {to} ].
	^ arguments