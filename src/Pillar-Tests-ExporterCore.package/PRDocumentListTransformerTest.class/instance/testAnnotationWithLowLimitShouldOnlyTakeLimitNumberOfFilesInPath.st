private
testAnnotationWithLowLimitShouldOnlyTakeLimitNumberOfFilesInPath
	| doc documentGroup links |
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
	
	links := documentGroup children select: [ :each | each class = PRInternalLink ].
	
	self deny: links size = 3.
	
	self assert: links size equals: 2.