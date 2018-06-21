running
testMethodCreationFailingCodeblock

	| testGenerator codeBlock |
	testGenerator := PRBookTestGenerator new.
	testGenerator fileName: 'TestMethodCreationFail'.
	testGenerator createClassFrom: testGenerator fileName.
	testGenerator cbIndex: 1.
	codeBlock := PRCodeblock content: '3+7>>>11' parameters: 'testcase=true'.
	testGenerator createTestMethodFrom: codeBlock.
	self assert: (TestMethodCreationFail methodDict includesKey: #test1).
	self assert: (TestMethodCreationFail methodDict at: #test1) sourceCode equals: 'test1
	
	self assert: (3+7>>>11) isPaired'.
	