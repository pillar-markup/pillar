private
testAnnotationWithWrongTemplateExtensionShouldNotContainsRaw
	| doc |
	self createTemplateFile.
	doc := PRDocument new 
				add: 
				(PRText new 
					text: 'You');
				add:
				(PRDocumentListAnnotation new 
					parameterAt: 'path' put: 'blogs';
					parameterAt: 'sort' put: 'name';
					parameterAt: 'limit' put: '3';
					parameterAt: 'templates' put: #('templates/docArticle.avi');
					yourself);
				yourself.
				
				
	((PRDocumentListTransformer withContext: (PRProject on: testingFileSystem)) start: doc).
	
	self deny: (doc children allSatisfy: [ :each | each class = PRRaw ])