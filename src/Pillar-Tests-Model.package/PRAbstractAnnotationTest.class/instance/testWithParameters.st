tests
testWithParameters

	self assert: (self actualClass withParameters: self referenceParameters) hadAllKeys
	