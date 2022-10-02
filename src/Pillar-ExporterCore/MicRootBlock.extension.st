Extension { #name : #MicRootBlock }

{ #category : #'*Pillar-ExporterCore' }
MicRootBlock >> pdfTransformationsFor: aDocument [

	^ #()
]

{ #category : #'*Pillar-ExporterCore' }
MicRootBlock >> transformDocumentFor: aPRPDFDocument [ 
	"This is a hook to be able to have framework specific transformation hooks.
	see PRAbstractOutputDocument>>#buildOn:"
	"Note that the resolution is made against the currently transformed file and not the base directory of the project else we may lose the fact that a figure is within multiple folders within the base project. 
	Compare 
		/base and
		/base/Chapters/Chapter1/FileContainingAReferenceToFigures.md
	When resolving figures/myPng referenced from within FileContainingAReferenceToFigures.md 
	we should get /base/Chapters/Chapter1/figures/myPng!
	Using base we lose Chapters/Chapter1 and only get /base/figures/myPng.
	"
	
	^ aPRPDFDocument transformDocument: (self resolveFrom: aPRPDFDocument file file asMicResourceReference )
]
