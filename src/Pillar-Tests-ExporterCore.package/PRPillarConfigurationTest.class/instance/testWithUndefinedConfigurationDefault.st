tests
testWithUndefinedConfigurationDefault
	(self configurationClass newFromString: '{}')
		inputString: 'input';
		disabledPhases: {#templating};
		export: 'mock'