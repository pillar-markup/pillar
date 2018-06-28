instance creation
withParameters: aPRParameters

	| parameters |
	self flag: 'checkKeysOf: does not make sense anymore, right?'.
	parameters := PRParametersToOrderedDictionary of: aPRParameters.
	parameters := self checkKeysOf: parameters.
	self validateParameters: parameters.
	^ (self with: aPRParameters)
		hadAllKeys: (self possibleParameters difference: (parameters keys collect: #asSymbol)) isEmpty;
		parameters: parameters;
		yourself