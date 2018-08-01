private
testAnnotationWithEmptyMultipleMustacheTemplateShouldNotContainsRaw
	| doc |
	"${docList:path=blogs}$"
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
	
	self deny: (doc children allSatisfy: [ :each | each class = PRRaw ])