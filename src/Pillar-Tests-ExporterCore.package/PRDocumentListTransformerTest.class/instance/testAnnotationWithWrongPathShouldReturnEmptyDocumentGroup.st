private
testAnnotationWithWrongPathShouldReturnEmptyDocumentGroup
	| doc documentGroup sections |
	"${docList:path=wrongDirectory|limit=3|sort=name}$"
	doc := PRDocument new 
				add: 
				(PRText new 
					text: 'You');
				add:
				(PRDocumentListAnnotation new 
					parameterAt: 'path' put: 'wrongDirectory';
					parameterAt: 'limit' put: '3';
					parameterAt: 'sort' put: 'name';
					yourself);
				yourself.
				
				
	((PRDocumentListTransformer withContext: (PRProject on: testingFileSystem)) start: doc).
	
	documentGroup := doc children second.
	
	sections := documentGroup children.
	self assert: sections isEmpty