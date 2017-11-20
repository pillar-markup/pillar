tests
testDocumentIsParser
	| task pillarDocument |
	task := PRPillarParseTask new
		input: (PRGenericObjectTask result: self exampleDocumentWithProperty utf8Encoded readStream).

	pillarDocument := task
		execute;
		result.

	self
		assert: pillarDocument
		equals: (PRDocument new
					add: (PRParagraph new
						add: (PRText content: 'foo'));
					yourself).