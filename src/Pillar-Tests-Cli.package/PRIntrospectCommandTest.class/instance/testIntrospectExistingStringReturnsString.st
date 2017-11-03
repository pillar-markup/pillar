tests
testIntrospectExistingStringReturnsString

	| string command |
	string := 'justSomeString'.
	command := self introspectorWithConfiguredObject: string.
	
	self assert: (command introspect: 'known') equals: string.