tests
testUrl
	self instance reference: self referenceString.
	self assert: self instance url equals: self expectedUrlForReferenceString.
	
	self instance reference: self simpleReferenceString.
	self assert: self instance url equals: self expectedUrlForSimpleReferenceString