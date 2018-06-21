running
testMethodCreationSyntaxErrorCodeblock

	| testGenerator codeBlock |
	testGenerator := PRBookTestGenerator new.
	testGenerator fileName: 'TestMethodCreationFail'.
	testGenerator createClassFrom: testGenerator fileName.
	testGenerator cbIndex: 1.
	codeBlock := PRCodeblock content: '(a1 at: 1) at: 1 put: ''sally''. a1 >>> #(#(''sally''))' parameters: 'testcase=true'.
	testGenerator createTestMethodFrom: codeBlock.
	self assert: (TestMethodCreationFail methodDict includesKey: #test1).
	self assert: (TestMethodCreationFail methodDict at: #test1) sourceCode equals: 'test1

	self assert: false description: ''A code block failed''. 
	"SyntaxErrorNotification was raised with: '')'' expected"
	"by the codeblock:(a1 at: 1) at: 1 put: ''sally''. a1 >>> #(#(''sally''))"'
	