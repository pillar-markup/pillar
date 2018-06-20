private
testWithoutSpecifyingTheDirectoryShouldRaiseError
	| doc |
	doc := PRDocument new 
				add: 
				(PRText new 
					text: 'You');
				add:
				(PRDocumentListAnnotation new 
					parameterAt: 'limit' put: '5';
					parameterAt: 'sort' put: 'name';
					yourself);
				yourself.
				
				
	self should: [((PRDocumentListTransformer withContext: (PRProject on: testingFileSystem)) start: doc)] raise: Error