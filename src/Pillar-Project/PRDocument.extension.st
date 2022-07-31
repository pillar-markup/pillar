Extension { #name : #PRDocument }

{ #category : #'*Pillar-Project' }
PRDocument >> dependencies [
	self shouldBeImplemented.
]

{ #category : #'*Pillar-Project' }
PRDocument >> pdfTransformationsFor: anOutputDocument [

	^ { 
		PRRelativeReferenceTransformer new
			inputFile: anOutputDocument inputFile;
			baseDirectory: anOutputDocument baseDirectory asAbsolute;
			outputDirectory: (anOutputDocument outputDirectory);
			yourself
		.
		PRLatexPathUpdateVisitor new 
		}
]
