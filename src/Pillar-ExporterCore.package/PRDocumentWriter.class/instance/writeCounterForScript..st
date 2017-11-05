helpers
writeCounterForScript: aScript
	aScript counter isValidCounter
		ifFalse: [ ^ self ].
	self writeCounter: aScript counter.
	self writeCounterDefinitionSeparator