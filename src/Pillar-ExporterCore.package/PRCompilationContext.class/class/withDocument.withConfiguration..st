instance creation
withDocument: aDocument withConfiguration: aConfiguration
	^ self new
		input: aDocument;
		configuration: aConfiguration;
		yourself