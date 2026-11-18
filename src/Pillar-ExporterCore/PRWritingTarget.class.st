Class {
	#name : 'PRWritingTarget',
	#superclass : 'PRTarget',
	#category : 'Pillar-ExporterCore-Base',
	#package : 'Pillar-ExporterCore',
	#tag : 'Base'
}

{ #category : 'testing' }
PRWritingTarget class >> isAbstract [
	^ self == PRWritingTarget
]

{ #category : 'preparation' }
PRWritingTarget >> copyCustomFilesOf: aPRProject to: aSupportDirectory [
	"Copy the files of the _custom folder of aPRProject over aSupportDirectory, the copy of _support in the output, so that each replaces the support file with the same path. The README explaining _custom is not a support file."

	| custom |
	custom := aPRProject customDirectory.
	custom exists ifFalse: [ ^ self ].
	custom allFiles do: [ :each |
			each = (custom / 'README.md') ifFalse: [
					| destination |
					destination := aSupportDirectory resolve:
						               (each relativeTo: custom).
					destination parent ensureCreateDirectory.
					destination ensureDelete.
					each copyTo: destination ] ]
]

{ #category : 'accessing' }
PRWritingTarget >> createConfigurationFrom: aPRProject [
	^ aPRProject configuration class new
		propertyAt: #_outputFormat put: self;
		parent: aPRProject configuration;
		yourself
]

{ #category : 'accessing' }
PRWritingTarget >> extension [
	
	^ self subclassResponsibility
]

{ #category : 'accessing' }
PRWritingTarget >> outputDirectoryName [
	
	^ self subclassResponsibility
]

{ #category : 'preparation' }
PRWritingTarget >> prepareForExecutionOn: aPRProject [
	"Remove the previous output of this target only (_result/pdf, _result/html, _result/site), so that the outputs of the other formats stay side by side; then copy _support there, the files of _custom over it, and the folders of the book."

	| configuration outputDirectory outputFormat target source |
	(aPRProject outputDirectory / self outputDirectoryName)
		ensureDeleteAll.
	configuration := self createConfigurationFrom: aPRProject.

	outputFormat := configuration propertyAt: #_outputFormat.
	target := aPRProject outputDirectory
	          / outputFormat outputDirectoryName resolve:
		          (Path from: '_support').
	source := aPRProject baseDirectory / '_support'.

	PRCopyPhase new
		sourceDirectory: source;
		destinationDirectory: target;
		executeOn: nil. "We used a configuration context here that is not needed anymore"
	self copyCustomFilesOf: aPRProject to: target.

	outputDirectory := aPRProject outputDirectory
	                   / self outputDirectoryName.
	aPRProject baseDirectory children do: [ :each |
			((each basename beginsWith: '_') or: [
				 each basename beginsWith: '.' ]) ifFalse: [
				each copyAllTo: outputDirectory / each basename ] ]
]

{ #category : 'accessing' }
PRWritingTarget >> writerFor: aPRPillarConfiguration [ 
	
	self subclassResponsibility
]

{ #category : 'accessing' }
PRWritingTarget >> writerFor: aPRPillarConfiguration forConfigurationTag: aTag [
	
	"(PRDocumentWriter allSubclasses detect: [ :each | 
		each isAbstract not
			and: [ each writerName = (aPRPillarConfiguration propertyAt: #latexWriter) ] ])
				new"
				
	^ (((SystemNavigation default allImplementorsOf: #writerName) 
		collect: [ :each | each methodClass instanceSide ]) 
			 detect: [ :each | 	each isAbstract not 
						and: [ each writerName asLowercase = (aPRPillarConfiguration propertyAt: aTag) asLowercase ] ]) new
]
