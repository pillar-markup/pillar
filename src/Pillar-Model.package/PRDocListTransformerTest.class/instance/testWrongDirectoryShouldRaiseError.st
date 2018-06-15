private
testWrongDirectoryShouldRaiseError
	| doc |
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
				
				
	self should: [((PRDocListTransformer withContext: (PRProject on: testingFileSystem)) start: doc)]
	raise: PRDirectoryError.