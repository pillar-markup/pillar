printing
asPillarParametersOn: aStream
	self parameters
		at: 'title'
		ifPresent: [ :v | self asPillarKey: 'title' value: v on: aStream]