instance creation
withParameters: aPRParameters
	| parameters anInstance |
	anInstance := self with: aPRParameters.
	self flag: 'checkKeysOf: does not make sense anymore, right?'.
	parameters := PRParametersToOrderedDictionary of: aPRParameters.
	parameters := self checkKeysOf: parameters.
	self validateParameters: aPRParameters dictionary: parameters in: anInstance.
	^ anInstance
		hadAllKeys:
			(self possibleParameters
				difference: (parameters keys collect: #asSymbol)) isEmpty;
		parameters: parameters;
		yourself