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
	self assert: (self class environment at: #PRTTestMethodCreationFail) suite run failures size equals:1.
	self assert: (self class environment at: #PRTTestMethodCreationFail) suite run errors isEmpty.
	self assert: (self class environment at: #PRTTestMethodCreationFail) suite run passed isEmpty.
	
	