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

	self assert: sections size equals: 12.
	
	self assert: sections first children first text equals: 'Okay'.
	self assert: (sections at: 5) children first text equals: 'That''s the second'.
	self assert: (sections at: 9) children first text equals: 'And the third'.