tests
testInvalidSTONGeneratesSTONError
	| task |

	task := PRParseTask new
		inputStreamDependency: (PRGenericObjectTask result: self exampleDocumentWithWrongStonSyntax utf8Encoded readStream).

	self should: [ task execute ] raise: STONReaderError