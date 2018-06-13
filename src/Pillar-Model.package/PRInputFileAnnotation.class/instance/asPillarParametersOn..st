printing
asPillarParametersOn: aStream
	self parameters
		at: 'value'
		ifPresent: [ :v | self asPillarKey: 'value' value: v asString on: aStream ]