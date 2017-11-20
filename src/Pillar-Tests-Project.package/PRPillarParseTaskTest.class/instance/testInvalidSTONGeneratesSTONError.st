tests
testInvalidSTONGeneratesSTONError
	| task |

	task := PRPillarParseTask new
		input: (PRGenericObjectTask result: self exampleDocumentWithWrongStonSyntax utf8Encoded readStream).

	self should: [ task execute ] raise: STONReaderError