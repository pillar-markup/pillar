tests
testDocumentPropertiesAreAccessible
	| doc data |
	doc := PRDocument new propertyAt: 'authors' put: 'Someone'; yourself.
	data := self actualClass new extractDataFrom: doc using: PRMockWriter new.
	self assert: (data hasProperty: 'authors').
	self assert: (data propertyAt: 'authors') equals: 'Someone'