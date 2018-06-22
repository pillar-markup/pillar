running
testMethodCreationFailingCodeblock

	| testGenerator codeBlock |
	testGenerator := PRBookTestGenerator new.
	testGenerator fileName: 'PRTTestMethodCreationFail'.
	testGenerator createClassFrom: testGenerator fileName.
	testGenerator cbIndex: 1.
	codeBlock := PRCodeblock content: '3+7>>>11' parameters: 'testcase=true'.
	testGenerator createTestMethodFrom: codeBlock.
	self assert: (PRTTestMethodCreationFail methodDict includesKey: #test1).
	self assert: (PRTTestMethodCreationFail methodDict at: #test1) sourceCode equals: 'test1
	
	self assert: ((3+7)>>>11) isPaired'.
	