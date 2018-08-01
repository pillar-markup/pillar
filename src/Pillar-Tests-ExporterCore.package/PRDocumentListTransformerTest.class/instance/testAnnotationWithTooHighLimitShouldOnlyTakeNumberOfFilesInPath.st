private
testAnnotationWithTooHighLimitShouldOnlyTakeNumberOfFilesInPath
	| doc documentGroup links |
	"${docList:path=blogs|limit=5}$"
	doc := PRDocument new 
				add: 
				(PRText new 
					text: 'You');
				add:
				(PRDocumentListAnnotation new 
					parameterAt: 'path' put: 'blogs';
					parameterAt: 'limit' put: '5';
					yourself);
				yourself.
				
				
	((PRDocumentListTransformer withContext: (PRProject on: testingFileSystem)) start: doc).
	
	documentGroup := doc children second.
	
	links := documentGroup children select: [ :each | each class = PRInternalLink ].
	
	self deny: links size = 5.
	
	"blogs is containing 3 files"
	self assert: links size equals: 3.