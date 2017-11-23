tests
testOutputFormatterUsesGoalFormatter

	| task result |
	task := PROutputFormatterTask new.
	task pillarDocumentDependency: (PRGenericObjectTask result: PRDocument new).
	task writer: self.
	
	result := task execute.
	
	self assert: result outputText equals: self textToWrite