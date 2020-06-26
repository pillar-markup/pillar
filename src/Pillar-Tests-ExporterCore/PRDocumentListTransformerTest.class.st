"
Test class for docList Transformer
"
Class {
	#name : #PRDocumentListTransformerTest,
	#superclass : #PRNodeTransformerTest,
	#instVars : [
		'testingFileSystem'
	],
	#category : #'Pillar-Tests-ExporterCore-Document-List'
}

{ #category : #'as yet unclassified' }
PRDocumentListTransformerTest class >> directoryNameForTest [

	^ 'blogs'
]

{ #category : #private }
PRDocumentListTransformerTest class >> fileContentsOne [

	^ '!! Okay

We gonna test annotations'
]

{ #category : #private }
PRDocumentListTransformerTest class >> fileContentsThree [

	^ '!! And the third

one for testing annotations'
]

{ #category : #private }
PRDocumentListTransformerTest class >> fileContentsTwo [

	^ '!! That''s the second

one for testing annotations'
]

{ #category : #private }
PRDocumentListTransformerTest class >> fileNameOne [

	^ 'blog1.pillar'
]

{ #category : #private }
PRDocumentListTransformerTest class >> fileNameThree [

	^ 'blog3.pillar'
]

{ #category : #private }
PRDocumentListTransformerTest class >> fileNameTwo [

	^ 'blog2.pillar'
]

{ #category : #private }
PRDocumentListTransformerTest class >> templateFileContents [

	^ '<div>
  <p>{{{content}}}</p>
</div>'
]

{ #category : #private }
PRDocumentListTransformerTest >> actualClass [
	^ PRDocumentListTransformer
]

{ #category : #private }
PRDocumentListTransformerTest >> createFilesIn: aDirectory [

	(aDirectory / PRDocumentListTransformerTest fileNameOne)
		writeStreamDo: [ :stream |
			stream nextPutAll: PRDocumentListTransformerTest fileContentsOne ].
		
	(aDirectory / PRDocumentListTransformerTest fileNameTwo)
		writeStreamDo: [ :stream |
			stream nextPutAll: PRDocumentListTransformerTest fileContentsTwo ].
		
	(aDirectory / PRDocumentListTransformerTest fileNameThree)
		writeStreamDo: [ :stream |
			stream nextPutAll: PRDocumentListTransformerTest fileContentsThree ]
]

{ #category : #private }
PRDocumentListTransformerTest >> createTemplateFile [
	| dir templateFile |
	dir := (testingFileSystem / 'templates') ensureCreateDirectory.
	templateFile := (dir / 'docArticle.mustache') ensureCreateFile.
	templateFile writeStreamDo: [ :stream |
			stream nextPutAll: self class templateFileContents ].
]

{ #category : #private }
PRDocumentListTransformerTest >> setUp [
	
	| workingDirectory |
	super setUp.
	testingFileSystem := FileSystem memory workingDirectory.
	workingDirectory := (testingFileSystem / PRDocumentListTransformerTest directoryNameForTest) ensureCreateDirectory.
	self createFilesIn: workingDirectory.
]

{ #category : #private }
PRDocumentListTransformerTest >> testAnnotationCreateGoodLinks [
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

	self assert: sections size equals: 6.
	self assert: (sections at: 2) reference  equals: 'blogs/blog1.pillar'.
	self assert: (sections at: 6) reference  equals: 'blogs/blog3.pillar'.
]

{ #category : #private }
PRDocumentListTransformerTest >> testAnnotationIsReplacedByFilesContents [
	| doc documentGroup sections |
	"${docList:path=blogs|limit=3}$"
	doc := PRDocument new 
				add: 
				(PRText new 
					text: 'You');
				add:
				(PRDocumentListAnnotation new 
					parameterAt: 'path' put: 'blogs';
					parameterAt: 'limit' put: '3';
					yourself);
				yourself.
				
				
	((PRDocumentListTransformer withContext: (PRProject on: testingFileSystem)) start: doc).
	
	documentGroup := doc children second.
	
	sections := documentGroup children.

	self assert: sections size equals: 6.
	
	self assert: sections first text equals: 'OkayWe gonna test annotations'.
]

{ #category : #private }
PRDocumentListTransformerTest >> testAnnotationWithEmptyMultipleMustacheTemplateShouldNotContainsRaw [
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
]

{ #category : #private }
PRDocumentListTransformerTest >> testAnnotationWithLowLimitShouldOnlyTakeLimitNumberOfFilesInPath [
	| doc documentGroup links |
	"${docList:path=blogs|limit=2}$"
	doc := PRDocument new
		add: (PRText new text: 'You');
		add:
			(PRDocumentListAnnotation new
				parameterAt: 'path' put: 'blogs';
				parameterAt: 'limit' put: '2';
				yourself);
		yourself.


	(PRDocumentListTransformer withContext: (PRProject on: testingFileSystem)) start: doc.

	documentGroup := doc children second.

	links := documentGroup children select: [ :each | each class = PRInternalLink ].

	self deny: links size equals: 3.

	self assert: links size equals: 2
]

{ #category : #private }
PRDocumentListTransformerTest >> testAnnotationWithMultipleMustacheTemplateShouldContainsRaw [
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
]

{ #category : #private }
PRDocumentListTransformerTest >> testAnnotationWithTooHighLimitShouldOnlyTakeNumberOfFilesInPath [
	| doc documentGroup links |
	"${docList:path=blogs|limit=5}$"
	doc := PRDocument new
		add: (PRText new text: 'You');
		add:
			(PRDocumentListAnnotation new
				parameterAt: 'path' put: 'blogs';
				parameterAt: 'limit' put: '5';
				yourself);
		yourself.


	(PRDocumentListTransformer withContext: (PRProject on: testingFileSystem)) start: doc.

	documentGroup := doc children second.

	links := documentGroup children select: [ :each | each class = PRInternalLink ].

	self deny: links size equals: 5.

	"blogs is containing 3 files"
	self assert: links size equals: 3
]

{ #category : #private }
PRDocumentListTransformerTest >> testAnnotationWithWrongPathShouldReturnEmptyDocumentGroup [
	| doc documentGroup sections |
	"${docList:path=wrongDirectory|limit=3|sort=name}$"
	doc := PRDocument new
		add: (PRText new text: 'You');
		add:
			(PRDocumentListAnnotation new
				parameterAt: 'path' put: 'wrongDirectory';
				parameterAt: 'limit' put: '3';
				parameterAt: 'sort' put: 'name';
				yourself);
		yourself.


	(PRDocumentListTransformer withContext: (PRProject on: testingFileSystem)) start: doc.

	documentGroup := doc children second.

	sections := documentGroup children.
	self assertEmpty: sections
]

{ #category : #private }
PRDocumentListTransformerTest >> testAnnotationWithWrongTemplateExtensionShouldNotContainsRaw [
	| doc |
	"${docList:path=blogs|sort=name|limit=3|templates=#('templates/docArticle.avi')}$"
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
]

{ #category : #private }
PRDocumentListTransformerTest >> testAnnotationWithoutLimitParameterShouldTakeDefaultLimitValue [
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

	self assert: sections size equals: 6.
	
	self assert: sections first text equals: 'OkayWe gonna test annotations'.

	"default value of limit 3"
	self assert: links size equals: 3
]

{ #category : #private }
PRDocumentListTransformerTest >> testAnnotationWithoutSortParameterShouldListFilesInArbitraryOrder [
	| doc documentGroup sections |
	"${docList:path=blogs|limit=2}$"
	doc := PRDocument new 
				add: 
				(PRText new 
					text: 'You');
				add:
				(PRDocumentListAnnotation new 
					parameterAt: 'path' put: 'blogs';
					parameterAt: 'limit' put: '2';
					yourself);
				yourself.
				
				
	((PRDocumentListTransformer withContext: (PRProject on: testingFileSystem)) start: doc).
	
	documentGroup := doc children second.
	sections := documentGroup children.
	
	self assert: sections size equals: 4.
	self assert: sections first text equals: 'OkayWe gonna test annotations'.
]

{ #category : #private }
PRDocumentListTransformerTest >> testAnnotationWithoutSpecifyingPathShouldRaiseError [
	| doc |
	"${docList:sort=name|limit=5}$"
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
]

{ #category : #private }
PRDocumentListTransformerTest >> testFilesAreSortedByBaseName [
	| doc documentGroup sections |
	"${docList:path=blogs|sort=name|limit=3}$"
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

	self assert: sections size equals: 6.
	
	self assert: (sections at: 1) text equals: 'OkayWe gonna test annotations'.
	self assert: (sections at: 3) text equals: 'That''s the secondone for testing annotations'.
	self assert: (sections at: 5) text equals: 'And the thirdone for testing annotations'.
]

{ #category : #private }
PRDocumentListTransformerTest >> testFilesAreSortedByModificationDate [
	| doc documentGroup sections |
	"${docList:path=blogs|limit=3|sort=date}$"
	doc := PRDocument new 
				add: 
				(PRText new 
					text: 'You');
				add:
				(PRDocumentListAnnotation new 
					parameterAt: 'path' put: 'blogs';
					parameterAt: 'limit' put: '3';
					parameterAt: 'sort' put: 'date';
					yourself);
				yourself.
				
				
	((PRDocumentListTransformer withContext: (PRProject on: testingFileSystem)) start: doc).
	
	documentGroup := doc children second.
	
	sections := documentGroup children.

	self assert: sections size equals: 6.
	
	self assert: (sections at: 1) text equals: 'And the thirdone for testing annotations'.
	self assert: (sections at: 3) text equals: 'That''s the secondone for testing annotations'.
	self assert: (sections at: 5) text equals: 'OkayWe gonna test annotations'.
]
