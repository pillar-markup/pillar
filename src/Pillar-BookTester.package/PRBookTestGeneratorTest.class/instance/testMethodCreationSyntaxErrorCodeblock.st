running
testMethodCreationSyntaxErrorCodeblock

	| testGenerator codeBlock |
	testGenerator := PRBookTestGenerator new.
	testGenerator fileName: 'PRTTestMethodCreationError'.
	testGenerator resultPackage: 'Pillar-BookTesterResults-TestResults'.
	testGenerator createClassFrom: testGenerator fileName.
	testGenerator cbIndex: 1.
	codeBlock := PRCodeblock content: '(a1 at: 1) at: 1 put: ''sally''. a1 >>> #(#(''sally''))' parameters: 'testcase=true'.
	testGenerator createTestMethodFrom: codeBlock.
	self assert: (PRTTestMethodCreationError methodDict includesKey: #test1).
	self assert: (PRTTestMethodCreationError methodDict at: #test1) sourceCode equals: 'test1

	self assert: Error signal description: ''A code block failed''. 
	"SyntaxErrorNotification was raised with: '')'' expected"
	"by the codeblock: ((a1 at: 1) at: 1 put: ''sally''. a1)>>>#(#(''sally''))"'.
	self assert: (self class environment at: #PRTTestMethodCreationError) suite run failures isEmpty.
	self assert: (self class environment at: #PRTTestMethodCreationError) suite run errors size equals:1.
	self assert: (self class environment at: #PRTTestMethodCreationError) suite run passed isEmpty.
	