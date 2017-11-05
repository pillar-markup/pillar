tests
testDependOnCleanAnnotationInParagraphTransfomer
	self assert: (self actualClass dependencies anySatisfy: [ :pipe | pipe key = #cleanAnnotationInParagraph ])