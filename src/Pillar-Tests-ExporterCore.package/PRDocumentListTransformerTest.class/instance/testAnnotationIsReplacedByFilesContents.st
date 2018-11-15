private
testAnnotationIsReplacedByFilesContents
	| doc documentGroup sections |
	"${docList:path=blogs|limit=3}$"
	doc := PRDocument new 
				add: 
				(PRText new 
					text: 'You');
				add:
				(PRDocumentListAnnotation new 
					parameterAt: 'path' put: 'blogs';
					parameterAt: 'limit' put: '3';
					yourself);
				yourself.
				
				
	((PRDocumentListTransformer withContext: (PRProject on: testingFileSystem)) start: doc).
	
	documentGroup := doc children second.
	
	sections := documentGroup children.

	self assert: sections size equals: 6.
	
	self assert: sections first text equals: 'OkayWe gonna test annotations'.