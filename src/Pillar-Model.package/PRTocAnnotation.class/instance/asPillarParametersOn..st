visiting
asPillarParametersOn: aStream
	self parameters
		at: 'depthLevel'
		ifPresent: [ :v | self asPillarKey: 'depthLevel' value: v on: aStream ].
	aStream nextPut: self class parameterSeparator.
	self parameters
		at: 'level'
		ifPresent: [ :v | self asPillarKey: 'level' value: v on: aStream ]