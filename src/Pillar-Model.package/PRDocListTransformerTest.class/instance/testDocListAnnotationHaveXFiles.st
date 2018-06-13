private
testDocListAnnotationHaveXFiles
	| doc |
	doc := PRDocument new 
				add:
				(PRDocListAnnotation new 
					parameterAt: 'directory' put: 'blogs';
					parameterAt: 'limit' put: '3';
					parameterAt: 'sort' put: 'date';
					yourself);
				yourself.
				
				
	((PRDocListTransformer withContext: (PRProject on: testingFileSystem)) start: doc).
	
	self assert: (testingFileSystem / 'directoryFiles.pillar') exists.