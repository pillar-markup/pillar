visiting
checkTestable: aParsedDocument

	aParsedDocument do: [ :each | (each hasParameter: 'testable')
												 ifTrue: [ allTests add: each text.
															  (self checkAssociation: each)
																	ifFalse: [failedTests add: each text] ] ]