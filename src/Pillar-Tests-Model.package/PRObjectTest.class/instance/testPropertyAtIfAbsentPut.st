tests-properties
testPropertyAtIfAbsentPut
	self assert: (self instance propertyAt: #foo put: 'bar') equals: 'bar'.
	self assert: (self instance propertyAt: #foo ifAbsentPut: [ 'baz' ]) equals: 'bar'.
	self assert: (self instance propertyAt: #foo) equals: 'bar'.

	self assert: (self instance propertyAt: #bar ifAbsentPut: [ 'baz' ]) equals: 'baz'.
	self assert: (self instance propertyAt: #bar) equals: 'baz'