tests
testDocumentConfigurationIsUsed
	| task pillarDocument |
	task := PRParseTask new
		inputStreamDependency: (PRGenericObjectTask result: self exampleDocumentWithProperty utf8Encoded readStream).

	pillarDocument := task
		execute;
		result.

	self assert: (pillarDocument propertyAt: 'mockProperty')