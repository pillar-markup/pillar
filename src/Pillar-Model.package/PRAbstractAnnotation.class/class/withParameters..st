instance creation
withParameters: aCollection

	| parameters |
	self flag: 'checkKeysOf: does not make sense anymore, right?'.
	"parameters := self checkKeysOf: aCollection."
	parameters := aCollection.
	self validateParameters: parameters.
	^ self new
		hadAllKeys: (self possibleParameters difference: (aCollection keys collect: #asSymbol)) isEmpty  ;
		parameters: parameters;
		yourself