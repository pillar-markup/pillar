rendering
asPillarParametersOn: aStream
	| nonDefaultParameters |
	nonDefaultParameters := self parameters keys asOrderedCollection.
	nonDefaultParameters remove: self defaultParameterName ifAbsent: [  ].

	"first handle the case of the defaultParameter (which btw can be absent)"
	self parameters
		at: self defaultParameterName
		ifPresent: [ :v | 
			aStream nextPutAll: v asString.
			aStream nextPut: self parameterSeparator ].
	"Then the rest"
	nonDefaultParameters
		do: [ :each | self asPillarKey: each value: ((self parameters at: each) asString) on: aStream ]
		separatedBy: [ aStream nextPut: self parameterSeparator ]