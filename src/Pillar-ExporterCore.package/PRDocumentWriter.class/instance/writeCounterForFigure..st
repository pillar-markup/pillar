helpers
writeCounterForFigure: aFigure
	aFigure counter isValidCounter
		ifFalse: [ ^ self ].
	self writeCounter: aFigure counter.
	self writeCounterDefinitionSeparator