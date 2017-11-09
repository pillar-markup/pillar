tests
testWithUndefinedConfigurationDefault
	(self configurationClass newFromString: '{}')
		inputString: 'input';
		propertyAt: #_outputFormat put: PRTextWriter new;
		disabledPhases: {#templating . #saving};
		export: 'mock'