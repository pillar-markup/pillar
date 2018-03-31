instance creation
withParameters: aCollection
	| parameters |

	parameters := self checkKeysOf: aCollection.
	self validateParameters: parameters.
	^ self new
		hadAllKeys: aCollection = parameters;
		parameters: parameters;
		yourself