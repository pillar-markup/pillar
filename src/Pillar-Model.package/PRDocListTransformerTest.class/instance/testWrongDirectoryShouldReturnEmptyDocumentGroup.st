private
testWrongDirectoryShouldReturnEmptyDocumentGroup
	| doc documentGroup sections |
	doc := PRDocument new 
				add: 
				(PRText new 
					text: 'You');
				add:
				(PRDocListAnnotation new 
					parameterAt: 'directory' put: 'wrongDirectory';
					parameterAt: 'limit' put: '3';
					parameterAt: 'sort' put: 'name';
					yourself);
				yourself.
				
				
	((PRDocListTransformer withContext: (PRProject on: testingFileSystem)) start: doc).
	
	documentGroup := doc children second.
	
	sections := documentGroup children.
	
	self assert: sections isEmpty