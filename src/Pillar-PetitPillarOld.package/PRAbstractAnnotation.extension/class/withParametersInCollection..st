*Pillar-PetitPillarOld
withParametersInCollection: aCollection

	| parameters |
	self flag: 'depricated, used only by the old parser'.
	parameters := self checkKeysOf: aCollection.
	self validateParameters: parameters.
	^ self new
		hadAllKeys: (self possibleParameters difference: (parameters keys collect: #asSymbol)) isEmpty  ;
		parameters: parameters;
		yourself