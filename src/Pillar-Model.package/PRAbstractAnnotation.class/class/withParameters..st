instance creation
withParameters: aCollection

	| parameters |
	parameters := self checkKeysOf: aCollection.
	self validateParameters: parameters.
	^ self new
		hadAllKeys: (self possibleParameters difference: (parameters keys collect: #asSymbol)) isEmpty  ;
		parameters: parameters;
		yourself