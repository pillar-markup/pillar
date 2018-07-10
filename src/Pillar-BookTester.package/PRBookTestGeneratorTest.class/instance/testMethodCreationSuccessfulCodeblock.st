running
testMethodCreationSuccessfulCodeblock

	| testGenerator codeBlock |
	testGenerator := PRBookTestGenerator new.
	testGenerator fileName: 'PRTTestMethodCreationSuccess'.
	testGenerator createClassFrom: testGenerator fileName.
	testGenerator cbIndex: 1.
	codeBlock := PRCodeblock content: '3+4>>>7' parameters: 'testcase=true'.
	testGenerator createTestMethodFrom: codeBlock.
	self assert: (PRTTestMethodCreationSuccess methodDict includesKey: #test1).
	self assert: (PRTTestMethodCreationSuccess methodDict at: #test1) sourceCode equals: 'test1
	
	self assert: ((3+4)>>>7) isPaired'.
	self assert: (self class environment at: #PRTTestMethodCreationSuccess) suite run failures isEmpty.
	self assert: (self class environment at: #PRTTestMethodCreationSuccess) suite run errors isEmpty.
	self assert: (self class environment at: #PRTTestMethodCreationSuccess) suite run passed size equals:1.