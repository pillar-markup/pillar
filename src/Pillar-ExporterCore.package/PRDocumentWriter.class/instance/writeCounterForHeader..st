helpers
writeCounterForHeader: aHeader
	| headerConf |
	headerConf := self configuration levelConfigurationFor: aHeader.
	(headerConf numbering and: [ aHeader counter isValidCounter and: [ headerConf size > 0 ] ])
		ifFalse: [ ^ self ].
	canvas nextPutAll: (headerConf printCounter: aHeader counter elements).
	self writeCounterDefinitionSeparator