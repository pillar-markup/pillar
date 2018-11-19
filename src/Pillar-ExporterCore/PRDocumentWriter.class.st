"
I'm the superclass of all classes supposed to output a pillar document to a text file. I have a canvas to which the subclasses can write to using dedicated brushes. I have a configuration which specifies some details about how to write text (e.g., end of line convention).

I can either emit the raw text or converted text. By default I convert text. 
"
Class {
	#name : #PRDocumentWriter,
	#superclass : #PRVisitor,
	#instVars : [
		'stream',
		'configuration',
		'canvas',
		'writingRaw'
	],
	#category : 'Pillar-ExporterCore-Base'
}

{ #category : #accessing }
PRDocumentWriter class >> defaultConfiguration [
	| defaultConfiguration |
	defaultConfiguration := ConfigurationForPillar new.
	defaultConfiguration properties at: 'outputType' put: self.
	defaultConfiguration properties at: 'configurations' put: Dictionary new.	"we specify an empty collection of sub configurations to avoid infinite recursion : a default configuration would otherwise contain a collection of default configurations, each containing a collection of default configurations..."
	^ defaultConfiguration
]

{ #category : #accessing }
PRDocumentWriter class >> defaultConfigurationName [
	^ self writerName
]

{ #category : #accessing }
PRDocumentWriter class >> fileExtension [
	^ self subclassResponsibility
]

{ #category : #accessing }
PRDocumentWriter class >> folderName [
	"This method is for decoupling the writer from its physical representation.
	It represents the physical folder name in the archetype, used when this writer is specified.
	For example your writerName can be latex:sbabook but the corresponding folderName is latex"
	^ self subclassResponsibility
]

{ #category : #testing }
PRDocumentWriter class >> isAbstract [
	^ self = PRDocumentWriter
]

{ #category : #accessing }
PRDocumentWriter class >> markupType [
	^ self writerName
]

{ #category : #'instance creation' }
PRDocumentWriter class >> on: aWriteStream [ 
	^ self new
		setStream: aWriteStream;
		yourself
]

{ #category : #'instance creation' }
PRDocumentWriter class >> write: aDocumentItem [
	^ self new write: aDocumentItem
]

{ #category : #'instance creation' }
PRDocumentWriter class >> write: aDocument to: aStream [
	^ self new write: aDocument to: aStream
]

{ #category : #accessing }
PRDocumentWriter class >> writerName [
	"Each writer define this to know the appropriate files to take for process. This one is different from folderName which corresponds to the physical representation. See folderName"
	^ self subclassResponsibility
]

{ #category : #accessing }
PRDocumentWriter >> canvasClass [
	^ self subclassResponsibility
]

{ #category : #accessing }
PRDocumentWriter >> configuration [
	^ configuration ifNil: [ configuration := ConfigurationForPillar new ]
]

{ #category : #accessing }
PRDocumentWriter >> configuration: aConfiguration [ 
	configuration := aConfiguration.
	stream ifNotNil: [ stream configuration: aConfiguration ]
]

{ #category : #streaming }
PRDocumentWriter >> contents [
	^ stream contents
]

{ #category : #private }
PRDocumentWriter >> defaultStream [
	^ WriteStream on: (String new: 1000)
]

{ #category : #accessing }
PRDocumentWriter >> fileExtension [
	^ self class fileExtension , '.json'
]

{ #category : #templating }
PRDocumentWriter >> folderName [

	^ self class folderName
]

{ #category : #helpers }
PRDocumentWriter >> getStringFor: anObject [
	"Visit anObject and exports everything to a new stream. Answer the stream content."
	^ self getStringForAll: { anObject }
]

{ #category : #helpers }
PRDocumentWriter >> getStringForAll: aCollection [
	"Visit each element of aCollection and exports everything to a new stream. Answer the stream content."
	^ String streamContents: [ :newStream | | visitor |
		visitor := (self class on: newStream)
			configuration: self configuration;
			yourself.
		aCollection do: [ :object | visitor start: object ] ]
]

{ #category : #initialization }
PRDocumentWriter >> initialize [
	super initialize.
	writingRaw := false.
	self setStream: self defaultStream.
	canvas := self canvasClass on: stream.
]

{ #category : #helpers }
PRDocumentWriter >> languageForScript: aScript [
	^ aScript language isSpecified
		ifTrue: [ aScript language ]
		ifFalse: [ self configuration defaultScriptLanguage ]
]

{ #category : #accessing }
PRDocumentWriter >> mainDocumentTemplateName [
	
	^ 'template'
]

{ #category : #accessing }
PRDocumentWriter >> markupType [
	^ self class markupType
]

{ #category : #helpers }
PRDocumentWriter >> noNewLineDuring: aBlock [
	| oldNewLine |
	oldNewLine := self configuration newLine.
	self configuration newLine: ''.
	aBlock ensure: [ self configuration newLine: oldNewLine ]
]

{ #category : #initialization }
PRDocumentWriter >> setStream: aStream [
	stream := PROutputStream on: aStream.
	configuration ifNotNil: [ stream configuration: configuration ].
	canvas ifNotNil: [ canvas setStream: stream ].
]

{ #category : #visiting }
PRDocumentWriter >> start: anObject [
	super start: anObject.
	canvas flush
]

{ #category : #templating }
PRDocumentWriter >> templateForConfiguration: aConfiguration [
	| inputFile templateName |
	configuration := aConfiguration.
	inputFile := configuration inputFile.
	
	(configuration hasProperty: #mainDocument)
		ifFalse: [ ^ configuration propertyAt: self mainDocumentTemplateName ifAbsent: [ 'main.mustache' ] ].
	
	templateName := inputFile fullName
		= ((configuration baseDirectory resolve: configuration mainDocument) , 'pillar') fullName
		ifTrue: [ self mainDocumentTemplateName ]
		ifFalse: [ self chapterTemplateName ].
	^ configuration propertyAt: templateName
]

{ #category : #'visiting-document' }
PRDocumentWriter >> visitEmptyParagraph: anObject [
	stream newLine
]

{ #category : #'visiting-document' }
PRDocumentWriter >> visitLineBreak: aLineBreak [
	canvas newLine
]

{ #category : #'visiting-document' }
PRDocumentWriter >> visitRaw: aRaw [
	(aRaw isForType: self writerName)
		ifTrue: [ self writeRawDuring: [ super visitRaw: aRaw ] ]
]

{ #category : #'visiting-document' }
PRDocumentWriter >> visitText: aText [
	writingRaw
		ifTrue: [ canvas rawLines: aText text ]
		ifFalse: [ canvas nextPutAllLines: aText text ]
]

{ #category : #visiting }
PRDocumentWriter >> write: aDocumentItem [
	^ self start: aDocumentItem; contents
]

{ #category : #visiting }
PRDocumentWriter >> write: aDocumentItem to: aStream [
	^ self setStream: aStream; start: aDocumentItem
]

{ #category : #helpers }
PRDocumentWriter >> writeCounter: aCounter [
	"Write on the canvas the string representation of ==aCounter=="

	^ aCounter elements do: [ :each | self writeCounterElement: each ] separatedBy: [ self writeCounterElementSeparator ]
]

{ #category : #helpers }
PRDocumentWriter >> writeCounterDefinitionSeparator [
	canvas nextPutAll: '. '
]

{ #category : #helpers }
PRDocumentWriter >> writeCounterElement: aCounterElement [
	canvas nextPutAll: aCounterElement asString
]

{ #category : #helpers }
PRDocumentWriter >> writeCounterElementSeparator [
	canvas nextPut: $.
]

{ #category : #helpers }
PRDocumentWriter >> writeCounterForFigure: aFigure [
	aFigure counter isValidCounter
		ifFalse: [ ^ self ].
	self writeCounter: aFigure counter.
	self writeCounterDefinitionSeparator
]

{ #category : #helpers }
PRDocumentWriter >> writeCounterForHeader: aHeader [
	| headerConf |
	headerConf := self configuration levelConfigurationFor: aHeader.
	(headerConf numbering and: [ aHeader counter isValidCounter and: [ headerConf size > 0 ] ])
		ifFalse: [ ^ self ].
	canvas nextPutAll: (headerConf printCounter: aHeader counter elements).
	self writeCounterDefinitionSeparator
]

{ #category : #helpers }
PRDocumentWriter >> writeCounterForScript: aScript [
	aScript counter isValidCounter
		ifFalse: [ ^ self ].
	self writeCounter: aScript counter.
	self writeCounterDefinitionSeparator
]

{ #category : #writing }
PRDocumentWriter >> writeParagraphDuring: aBlockClosure [ 
	
	self subclassResponsibility
]

{ #category : #helpers }
PRDocumentWriter >> writeRawDuring: aBlock [
	[ 
	writingRaw := true.
	aBlock value ]
		ensure: [ writingRaw := false ]
]

{ #category : #compatibility }
PRDocumentWriter >> writerFor: aPRPillarConfiguration [ 
	
	^ self
]

{ #category : #accessing }
PRDocumentWriter >> writerName [
	^ self class writerName
]
