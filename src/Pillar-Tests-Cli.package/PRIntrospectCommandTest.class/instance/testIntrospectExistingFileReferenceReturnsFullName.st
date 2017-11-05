tests
testIntrospectExistingFileReferenceReturnsFullName

	| command reference |
	reference := 'justSomeString' asFileReference.
	command := self introspectorWithConfiguredObject: reference.
	
	self assert: (command introspect: 'known') equals: reference fullName.