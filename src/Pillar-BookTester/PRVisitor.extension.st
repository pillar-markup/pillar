Extension { #name : #PRVisitor }

{ #category : #'*Pillar-BookTester' }
PRVisitor >> visitLoaderAnnotation: aLoaderAnnotation [ 
	self visitAnnotation: aLoaderAnnotation
]

{ #category : #'*Pillar-BookTester' }
PRVisitor >> visitRunAnnotation: aRunAnnotation [ 
	self visitAnnotation: aRunAnnotation
]

{ #category : #'*Pillar-BookTester' }
PRVisitor >> visitScreenshotAnnotation: aScreenshotAnnotation [ 
	self visitAnnotation: aScreenshotAnnotation
]

{ #category : #'*Pillar-BookTester' }
PRVisitor >> visitShowClassAnnotation: aShowClassAnnotation [ 
	self visitAnnotation: aShowClassAnnotation
]

{ #category : #'*Pillar-BookTester' }
PRVisitor >> visitShowMethodAnnotation: aShowMethodAnnotation [ 
	self visitAnnotation: aShowMethodAnnotation
]
