private
testFilesAreSortedByBaseName
	| doc documentGroup sections |
	"${docList:path=blogs|sort=name|limit=3}$"
	doc := PRDocument new 
				add: 
				(PRText new 
					text: 'You');
				add:
				(PRDocumentListAnnotation new 
					parameterAt: 'path' put: 'blogs';
					parameterAt: 'limit' put: '3';
					parameterAt: 'sort' put: 'name';
					yourself);
				yourself.
				
				
	((PRDocumentListTransformer withContext: (PRProject on: testingFileSystem)) start: doc).
	
	documentGroup := doc children second.
	
	sections := documentGroup children.

	self assert: sections size equals: 6.
	
	self assert: (sections at: 1) text equals: 'OkayWe gonna test annotations'.
	self assert: (sections at: 3) text equals: 'That''s the secondone for testing annotations'.
	self assert: (sections at: 5) text equals: 'And the thirdone for testing annotations'.