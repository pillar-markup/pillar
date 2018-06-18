private
testFilesAreSortedByModificationDate
	| doc documentGroup sections |
	doc := PRDocument new 
				add: 
				(PRText new 
					text: 'You');
				add:
				(PRDocListAnnotation new 
					parameterAt: 'path' put: 'blogs';
					parameterAt: 'limit' put: '3';
					parameterAt: 'sort' put: 'date';
					yourself);
				yourself.
				
				
	((PRDocListTransformer withContext: (PRProject on: testingFileSystem)) start: doc).
	
	documentGroup := doc children second.
	
	sections := documentGroup children.

	self assert: sections size equals: 12.
	
	self assert: sections first children first text equals: 'And the third'.