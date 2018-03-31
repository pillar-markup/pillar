protected
checkKeysOf: aCollection
	"aCollection may be a SmallDictionary('Foo'->nil 'number'->'5')"
		
	| nilParameters |
	nilParameters := 0.
	aCollection values
		do: [ :each | 
			each isNil
				ifTrue: [ nilParameters := nilParameters + 1 ] ].
	self raiseErrorIfTooManyDefaultParameters: nilParameters.
	^ nilParameters = 1
		ifTrue: [ self adaptKeysOn: aCollection ]
		ifFalse: [ aCollection ]