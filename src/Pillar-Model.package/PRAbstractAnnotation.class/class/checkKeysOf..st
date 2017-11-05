protected
checkKeysOf: aCollection
	| nilParameters |
	nilParameters := 0.
	aCollection values
		do: [ :each | 
			each isNil
				ifTrue: [ nilParameters := nilParameters + 1 ] ].
	self raiseErrorIfTooManyParameters: nilParameters.
	^ nilParameters = 1
		ifTrue: [ self adaptKeysOn: aCollection ]
		ifFalse: [ aCollection ]