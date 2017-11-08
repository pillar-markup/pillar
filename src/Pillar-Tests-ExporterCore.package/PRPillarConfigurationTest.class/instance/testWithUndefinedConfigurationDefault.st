tests
testWithUndefinedConfigurationDefault
	(self configurationClass newFromString: '{}')
		inputString: 'input';
		disabledPhases: {#templating . #saving};
		export: 'mock'