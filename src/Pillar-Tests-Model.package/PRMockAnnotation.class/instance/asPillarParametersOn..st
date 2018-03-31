printing
asPillarParametersOn: aStream
	self parameters keys
		do: [ :each | self asPillarKey: each value:  (self parameters at: each) on: aStream ]
		separatedBy: [ aStream nextPut: self class parameterSeparator ]