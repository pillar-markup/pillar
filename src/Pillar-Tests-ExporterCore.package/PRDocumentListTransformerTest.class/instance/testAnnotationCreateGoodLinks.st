private
testAnnotationCreateGoodLinks
	| doc documentGroup sections |
	"${docList:path=blogs|limit=3|sort=name}$"
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
	self assert: (sections at: 4) reference  equals: 'blogs/blog1.pillar'.
	self assert: (sections at: 12) reference  equals: 'blogs/blog3.pillar'.