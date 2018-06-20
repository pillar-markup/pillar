tests-properties
testPropertyAt
	self assert: (self instance propertyAt: #foo put: 'bar') equals: 'bar'.
	self assert: (self instance propertyAt: #foo) equals: 'bar'.
	self should: [ self instance propertyAt: #bar ] raise: PRPropertyError