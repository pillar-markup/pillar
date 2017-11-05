tests
testIntrospectNonExistingStringFails

	| command |
	command := self introspectorWithConfiguredObject: 'whatever'.
	self should: [command introspect: 'notInConfiguration'] raise: CCConfigurationError.