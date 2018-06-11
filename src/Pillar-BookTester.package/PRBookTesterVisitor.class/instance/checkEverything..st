visiting
checkEverything: aParsedDocument
	"This method should look for all codeBlocks in a parsed document and add them to allTests. Then, it should also test the association and add any failed test to failedTests"
	aParsedDocument do: [ :each | each isCodeBlock
												 ifTrue: [ allTests add: each text.
															  (self checkAssociation: each)
																	ifFalse: [failedTests add: each text] ] ]