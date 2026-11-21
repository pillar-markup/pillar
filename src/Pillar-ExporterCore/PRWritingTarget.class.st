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
PRWritingTarget >> copyBookOf: aPRProject to: anOutputDirectory [
	"Copy the files and folders of the book aPRProject into anOutputDirectory, except the ones whose name starts with _ or . (_support, _custom, _result, .git...): LaTeX and the HTML page need the chapters, their figures and the bibliography next to the document they compile or show."

	aPRProject baseDirectory children do: [ :each |
			((each basename beginsWith: '_') or: [
				 each basename beginsWith: '.' ]) ifFalse: [
				each copyAllTo: anOutputDirectory / each basename ] ]
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

{ #category : 'writing' }
PRWritingTarget >> exampleWriterSetting [
	"Answer the usual writer of my format as written in pillar.conf."

	^ self subclassResponsibility
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
	"Check that aPRProject is a book; remove the previous output of this target only (_result/pdf, _result/html, _result/site), so that the outputs of the other formats stay side by side; then copy _support there, the files of _custom over it, and the files of the book (see copyBookOf:to:)."

	| configuration outputFormat target source |
	aPRProject checkIsABook.
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
	self
		copyBookOf: aPRProject
		to: aPRProject outputDirectory / self outputDirectoryName
]

{ #category : 'accessing' }
PRWritingTarget >> writerFor: aPRPillarConfiguration [ 
	
	self subclassResponsibility
]

{ #category : 'writing' }
PRWritingTarget >> writerFor: aPRPillarConfiguration forConfigurationTag: aTag [
	"Answer a new writer named by aTag in pillar.conf (htmlWriter, latexWriter); raise a PRCommandError naming my writers when the setting is missing or unknown."

	| name |
	name := aPRPillarConfiguration propertyAt: aTag ifAbsent: [
			        PRCommandError signal:
				        ('pillar.conf has no {1}: add for example "{1}" : {2} (writers: {3}).'
					         format: {
							         aTag.
							         self exampleWriterSetting.
							         self writerNamesText }) ].
	^ (((SystemNavigation default allImplementorsOf: #writerName)
		    collect: [ :each | each methodClass instanceSide ])
		   detect: [ :each |
				   each isAbstract not and: [
					   each writerName asLowercase = name asLowercase ] ]
		   ifNone: [
				   PRCommandError signal:
					   ('Unknown {1} {2} in pillar.conf (writers: {3}).' format: {
							    aTag.
							    name.
							    self writerNamesText }) ]) new
]

{ #category : 'writing' }
PRWritingTarget >> writerNames [
	"Answer the names of the writers of my format, to write in pillar.conf."

	^ self subclassResponsibility
]

{ #category : 'writing' }
PRWritingTarget >> writerNamesText [

	^ ', ' join: self writerNames
]
