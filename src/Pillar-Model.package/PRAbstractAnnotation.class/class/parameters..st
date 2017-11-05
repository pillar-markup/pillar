instance creation
parameters: aCollection
	| parameters |
	parameters := self checkKeysOf: aCollection.
	^ self new
		hadAllKeys: aCollection = parameters;
		parameters: (PRMagritteDictionaryReader writeDictionary: parameters for: self);
		yourself