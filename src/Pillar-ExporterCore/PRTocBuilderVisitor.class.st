"
I am a visitor in charge of extracting table of contents from the files by visiting headers and inputAnnotations.

How to !?

PRTocBuilderVisitor new 
	documentSource: (FileSystem workingDirectory / 'file.pillar'); 
	currentFile: 'file.pillar';  
	inProcessFiles: (Array with: (FileSystem workingDirectory  / 'file.pillar' )); 
	visit: (PRPillarParser parse: (FileSystem workingDirectory / 'file.pillar') asFileReference readStream)
"
Class {
	#name : #PRTocBuilderVisitor,
	#superclass : #PRVisitor,
	#instVars : [
		'toc',
		'tocsStack',
		'documentSource',
		'currentFile',
		'inProcessFiles'
	],
	#category : 'Pillar-ExporterCore-Toc'
}

{ #category : #testing }
PRTocBuilderVisitor class >> isAbstract [

	^ false
]

{ #category : #visiting }
PRTocBuilderVisitor >> addToToc: aTocTitle [
	self top level < aTocTitle level
		ifTrue: [ self top addChildren: aTocTitle.
			self push: aTocTitle ]
		ifFalse: [ self pop.
			self addToToc: aTocTitle ]
]

{ #category : #accessing }
PRTocBuilderVisitor >> currentFile [
	^ currentFile
]

{ #category : #accessing }
PRTocBuilderVisitor >> currentFile: anObject [
	currentFile := anObject
]

{ #category : #accessing }
PRTocBuilderVisitor >> documentSource [
	^ documentSource
]

{ #category : #accessing }
PRTocBuilderVisitor >> documentSource: anObject [
	documentSource := anObject
]

{ #category : #accessing }
PRTocBuilderVisitor >> inProcessFiles: anObject [
	inProcessFiles := anObject
]

{ #category : #initialization }
PRTocBuilderVisitor >> initialize [
	super initialize.
	toc := PRToc new level: 0.
	tocsStack := Stack new.
	tocsStack push: toc.
	inProcessFiles := #()
]

{ #category : #accessing }
PRTocBuilderVisitor >> pop [
	^ tocsStack pop
]

{ #category : #accessing }
PRTocBuilderVisitor >> push: aToc [
	^ tocsStack push: aToc
]

{ #category : #accessing }
PRTocBuilderVisitor >> tableOfContents [
	^ toc
]

{ #category : #accessing }
PRTocBuilderVisitor >> top [
	^ tocsStack top
]

{ #category : #initialization }
PRTocBuilderVisitor >> validateInclusionOfFile: aSource [
	
	self documentSource = aSource ifTrue: [ 
		PRCyclicFileInclusionError new
			files: { aSource };
			signal
	].

	(inProcessFiles includes: aSource)
		ifTrue: [ PRCyclicFileInclusionError new
			files: (inProcessFiles copyWith: aSource);
			signal 
	]
]

{ #category : #visiting }
PRTocBuilderVisitor >> visit: aDocument [
	super visit: aDocument.
	^ toc
]

{ #category : #visiting }
PRTocBuilderVisitor >> visitHeader: aHeader [
	| titleToc|
	titleToc := PRToc new name: aHeader text; level: aHeader level; fileReference: currentFile.
	self addToToc: titleToc
	
]

{ #category : #initialization }
PRTocBuilderVisitor >> visitInputFileAnnotation: anAnnotation [
	| document sourceSave currentSave newSource |
	"Resolve and parse the new file"
	sourceSave := self documentSource.
	currentSave := self currentFile.
	newSource := self documentSource parent resolve: anAnnotation path.
	self validateInclusionOfFile: newSource.
	document := PRPillarParserMain parse: newSource contents.
	self documentSource: newSource.
	self currentFile: anAnnotation path.

	"Update inProcessFiles with the actual document"
	self
		inProcessFiles: (inProcessFiles copyWith: self documentSource);
		visit: document.

	"Get the original values"
	self currentFile: currentSave.
	self documentSource: sourceSave
]
