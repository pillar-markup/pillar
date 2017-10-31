tests
testDocumentPropertiesTakePrecedence
	| doc data conf |
	doc := PRDocument new
		propertyAt: 'title' put: 'Should win';
		yourself.
	conf :=  self configurationClass  new.
	conf title: 'Should fail'.
	data := self actualClass new
		configuration: conf;
		extractDataFrom: doc using: PRMockWriter new.
	self assert: (data hasProperty: 'title').
	self assert: (data propertyAt: 'title') equals: 'Should win'