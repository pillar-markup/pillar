private
testAnnotationWithoutLimitParameterShouldTakeDefaultLimitValue
	| doc documentGroup sections links |
	"${docList:path=blogs|sort=name}$"
	doc := PRDocument new 
				add: 
				(PRText new 
					text: 'You');
				add:
				(PRDocumentListAnnotation new 
					parameterAt: 'path' put: 'blogs';
					parameterAt: 'sort' put: 'name';
					yourself);
				yourself.
				
				
	((PRDocumentListTransformer withContext: (PRProject on: testingFileSystem)) start: doc).
	
	documentGroup := doc children second.
	
	sections := documentGroup children.

	links := sections select: [ :each | each class = PRInternalLink ].

	self assert: sections size equals: 12.
	
	self assert: sections first children first text equals: 'Okay'.
	
	"default value of limit 3"
	self assert: links size equals: 3