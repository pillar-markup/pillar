private
testAnnotationWithoutSortParameterShouldListFilesInArbitraryOrder
	| doc documentGroup sections |
	"${docList:path=blogs|limit=2}$"
	doc := PRDocument new 
				add: 
				(PRText new 
					text: 'You');
				add:
				(PRDocumentListAnnotation new 
					parameterAt: 'path' put: 'blogs';
					parameterAt: 'limit' put: '2';
					yourself);
				yourself.
				
				
	((PRDocumentListTransformer withContext: (PRProject on: testingFileSystem)) start: doc).
	
	documentGroup := doc children second.
	sections := documentGroup children.
	
	self assert: sections size equals: 8.
	self assert: sections first children first text equals: 'Okay'.