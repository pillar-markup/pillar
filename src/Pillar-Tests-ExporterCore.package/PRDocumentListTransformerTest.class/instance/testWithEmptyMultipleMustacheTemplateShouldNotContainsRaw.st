private
testWithEmptyMultipleMustacheTemplateShouldNotContainsRaw
	| doc |
	self createTemplateFile.
	doc := PRDocument new 
				add: 
				(PRText new 
					text: 'You');
				add:
				(PRDocumentListAnnotation new 
					parameterAt: 'path' put: 'blogs';
					yourself);
				yourself.
				
				
	((PRDocumentListTransformer withContext: (PRProject on: testingFileSystem)) start: doc).
	
	self assert: (doc children anySatisfy: [ :each | each class = PRDocumentGroup ])