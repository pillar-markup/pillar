printing
asPillarParametersOn: aStream
	self parameters
		at: 'width'
		ifPresent: [ :v | self asPillarKey: 'width' value: v asString on: aStream ]