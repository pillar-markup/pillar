private
testAnnotationWithMultipleMustacheTemplateShouldContainsRaw
	| doc |
	"${docList:path=blogs|sort=name|limit=3|templates=#('templates/docArticle.mustache' 'templates/me.mustache')}$"
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
					parameterAt: 'templates' put: #('templates/docArticle.mustache' 'templates/me.mustache');
					yourself);
				yourself.
				
				
	((PRDocumentListTransformer withContext: (PRProject on: testingFileSystem)) start: doc).
	
	self assert: (doc children anySatisfy: [ :each | each class = PRRaw ])