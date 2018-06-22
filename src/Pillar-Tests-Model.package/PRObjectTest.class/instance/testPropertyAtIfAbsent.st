tests-properties
testPropertyAtIfAbsent
	self assert: (self instance propertyAt: #foo put: 'bar') equals: 'bar'.
	self assert: (self instance propertyAt: #foo ifAbsent: [ 'baz' ]) equals: 'bar'.
	self assert: (self instance propertyAt: #bar ifAbsent: [ 'baz' ]) equals: 'baz'