printing
asPillarParametersOn: aStream
	self parameters
		at: 'path'
		ifPresent: [ :v | self asPillarKey: 'path' value: v on: aStream ]