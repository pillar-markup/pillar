tests
testWithUndefinedConfigurationNotDefault
	self should: [ ( self configurationClass  newFromString: '{}')
							export: 'not existing' ] raise: PRConfigurationError