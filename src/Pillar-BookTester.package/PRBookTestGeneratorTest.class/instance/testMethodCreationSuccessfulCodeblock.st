running
testMethodCreationSuccessfulCodeblock

	| testGenerator codeBlock |
	testGenerator := PRBookTestGenerator new.
	testGenerator fileName: 'TestMethodCreationSuccess'.
	testGenerator createClassFrom: testGenerator fileName.
	testGenerator cbIndex: 1.
	codeBlock := PRCodeblock content: '3+4>>>7' parameters: 'testcase=true'.
	testGenerator createTestMethodFrom: codeBlock.
	self assert: (TestMethodCreationSuccess methodDict includesKey: #test1).
	self assert: (TestMethodCreationSuccess methodDict at: #test1) sourceCode equals: 'test1
	
	self assert: (3+4>>>7) isPaired'.
	
	