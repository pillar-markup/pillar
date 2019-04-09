"
I replace each ==inputFile== annotation with the content of the referenced file.
"
Class {
	#name : #PRFileInclusion,
	#superclass : #PRNodeTransformer,
	#instVars : [
		'shouldTransform',
		'input',
		'goal',
		'topFile',
		'expansionTask',
		'inProcessFiles'
	],
	#category : #'Pillar-ExporterCore-Transformers'
}

{ #category : #configuration }
PRFileInclusion >> doNotTransform [
	shouldTransform := false
]

{ #category : #accessing }
PRFileInclusion >> expansionTask: aPRExpandInclusionsTask [ 
	expansionTask := aPRExpandInclusionsTask
]

{ #category : #accessing }
PRFileInclusion >> goal: aGoal [ 
	goal := aGoal
]

{ #category : #accessing }
PRFileInclusion >> inProcessFiles: aCollection [ 
	inProcessFiles := aCollection
]

{ #category : #initialization }
PRFileInclusion >> initialize [

	super initialize.
	inProcessFiles := #()
]

{ #category : #'visiting-document' }
PRFileInclusion >> input: anInputDocument [

	input := anInputDocument
]

{ #category : #testing }
PRFileInclusion >> isFileInclusionPhase [
	
	^ true
]

{ #category : #testing }
PRFileInclusion >> shouldTransform [
	^ shouldTransform ifNil: [ shouldTransform := true ]
]

{ #category : #accessing }
PRFileInclusion >> topFile: aFileReference [

	topFile := aFileReference
]

{ #category : #validation }
PRFileInclusion >> validateInclusionOfFile: aFileReference [ 
	
	aFileReference = topFile ifTrue: [ 
		PRCyclicFileInclusionError new
			files: { topFile };
			signal
	].

	(inProcessFiles includes: aFileReference)
		ifTrue: [ PRCyclicFileInclusionError new
			files: (inProcessFiles copyWith: aFileReference);
			signal  ]
]

{ #category : #'visiting-document' }
PRFileInclusion >> visitInputFileAnnotation: anInputFileAnnotation [
	"I load the file and if the file exist I replace the node of the annotation by the content of the file."
	| includedFile includedPillarAST cleanPillarAST |
	includedFile := topFile parent resolve: anInputFileAnnotation path.
	self validateInclusionOfFile: includedFile.
	
	includedPillarAST := PRDocument parser parse: includedFile.
	
	cleanPillarAST := (PRCleanAnnotationInParagraphTransformer new
		configuration: self configuration;
		start: includedPillarAST).
	
	"Execute a file inclusion step recursively" 
	includedPillarAST := PRFileInclusion new
		topFile: includedFile;
		inProcessFiles: (inProcessFiles copyWith: topFile);
		start: cleanPillarAST.
	
	"If we include a file, we need to update all references to external files in it.
	References that were before relative to the included document, should be now relative to the container document."
	PRUpdateFileInclusionReference
		start: includedPillarAST
		with: (includedFile parent relativeTo: topFile parent) pillarPrintString.
	
	self replace: includedPillarAST children.
]
