tests
testWrongTagInDocumentGeneratesPRError
	| task |

	task := PRParseTask new
		inputStreamDependency: (PRGenericObjectTask result: self exampleDocumentWithWrongTag utf8Encoded readStream).

	self should: [ task execute ] raise: PRError