instance creation
selector: testSelector arguments: arguments

	^ self new
		setTestSelector: testSelector;
		setTestArguments: arguments;
		yourself