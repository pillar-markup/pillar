tests-properties
testPropertyAtIfAbsent
	self assert: (self instance propertyAt: #foo put: 'bar') = 'bar'.
	self assert: (self instance propertyAt: #foo ifAbsent: [ 'baz' ]) = 'bar'.
	self assert: (self instance propertyAt: #bar ifAbsent: [ 'baz' ]) = 'baz'