tests
testDocumentConfigurationIsUsed
	| task pillarDocument |
	task := PRPillarParseTask new
		input: (PRGenericObjectTask result: self exampleDocumentWithProperty utf8Encoded readStream).

	pillarDocument := task
		execute;
		result.

	self assert: (pillarDocument propertyAt: 'mockProperty')