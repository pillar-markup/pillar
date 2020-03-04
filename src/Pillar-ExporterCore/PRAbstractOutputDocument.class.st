Class {
	#name : #PRAbstractOutputDocument,
	#superclass : #Object,
	#instVars : [
		'project',
		'file',
		'target',
		'outputDirectory'
	],
	#category : #'Pillar-ExporterCore-Base'
}

{ #category : #accessing }
PRAbstractOutputDocument >> baseDirectory [
	
	^ project baseDirectory
]

{ #category : #writing }
PRAbstractOutputDocument >> basicWriter [
	
	self subclassResponsibility
]

{ #category : #building }
PRAbstractOutputDocument >> buildOn: aPRProject [ 
	
	| parsedDocument transformedDocument writtenFile |
	parsedDocument := self parseInputFile: file.
	parsedDocument properties: (self metadataConfigurationForDocument: parsedDocument).
	transformedDocument := self transformDocument: parsedDocument.
	writtenFile := self writeDocument: transformedDocument.
	self postWriteTransform: writtenFile.
	^ PRSuccess new.
]

{ #category : #accessing }
PRAbstractOutputDocument >> configuration [
	
	^ project configuration
]

{ #category : #accessing }
PRAbstractOutputDocument >> extension [
	self subclassResponsibility
]

{ #category : #accessing }
PRAbstractOutputDocument >> file: aFile [
	
	file := aFile
]

{ #category : #metadata }
PRAbstractOutputDocument >> getMustacheTemplateValuesFromDocument: aDocument [
	"aDocument already has a conifguration holding potential metadata. 
	We add the text contents to it. This dictionarylike structure will be used by the mustache."

	| templates content |
	content := self writer write: aDocument.
	templates := aDocument properties.
	templates at: #content put: content.
	^ templates
]

{ #category : #accessing }
PRAbstractOutputDocument >> inputFile [
	
	^ file file
]

{ #category : #metadata }
PRAbstractOutputDocument >> metadataConfigurationForDocument: aDocument [ 
	"create an environment with the local document properties as children of the document properties."
	
	| subConfiguration |
	subConfiguration := project configuration class newFromDictionary: aDocument properties.
	subConfiguration parent: project configuration.
	^ subConfiguration
]

{ #category : #accessing }
PRAbstractOutputDocument >> outputDirectory [
	
	^ outputDirectory ifNil: [ project outputDirectory ]
]

{ #category : #accessing }
PRAbstractOutputDocument >> outputDirectory: aFileReference [ 
	
	outputDirectory := aFileReference 
]

{ #category : #building }
PRAbstractOutputDocument >> parseInputFile: anInputFile [

	^ PRDocument parser parse: anInputFile file
]

{ #category : #building }
PRAbstractOutputDocument >> postWriteTransform: aFile [

	"Nothing. Hook for subclasses"
]

{ #category : #accessing }
PRAbstractOutputDocument >> project: aPRProject [ 
	
	project := aPRProject
]

{ #category : #accessing }
PRAbstractOutputDocument >> tableOfContents [
	
	^ project tableOfContents
]

{ #category : #accessing }
PRAbstractOutputDocument >> target: aTarget [ 
	target := aTarget
]

{ #category : #templating }
PRAbstractOutputDocument >> templateDirectory [

	^ project baseDirectory / '_support' / 'templates' / self writer folderName
]

{ #category : #templating }
PRAbstractOutputDocument >> templateFile [
	
	^ project baseDirectory / (self writer templateForConfiguration: project configuration)
]

{ #category : #templating }
PRAbstractOutputDocument >> templateFile: aDocument [

	^ self templateDirectory
		/ (aDocument propertyAt: 'template' ifAbsent: [ self writer templateForConfiguration: project configuration ])
]

{ #category : #building }
PRAbstractOutputDocument >> transformDocument: aDocument [

	| inclusionVisitor withInclusions |
	inclusionVisitor := PRFileInclusion new.
	inclusionVisitor topFile: file file.
	withInclusions := inclusionVisitor start: (PRCleanAnnotationInParagraphTransformer new start: aDocument).

	^ self transformations
		inject: withInclusions
		into: [ :accum :each | each start: accum ]
]

{ #category : #accessing }
PRAbstractOutputDocument >> transformations [
	
	^ target transformations
]

{ #category : #building }
PRAbstractOutputDocument >> writeDocument: aDocument [

	| environment templatedOutput outputFile |
	environment := self getMustacheTemplateValuesFromDocument: aDocument.
	templatedOutput := (MustacheTemplate on: (self templateFile: aDocument) readStream contents) value: environment.
	
	
	self flag: #DuplicatedInSubclass.
	outputFile := (self outputDirectory resolve: (file file asAbsolute relativeTo: project baseDirectory asAbsolute)) withoutExtension , self extension.
	outputFile ensureDelete.
	outputFile parent ensureCreateDirectory.
	outputFile writeStreamDo: [ :stream | stream nextPutAll: templatedOutput ].
	^ outputFile
]

{ #category : #writing }
PRAbstractOutputDocument >> writer [
	
	"If templating is active in the command, use the templated writer"
	| writer |
	writer := self basicWriter.
	project isTemplatable ifTrue: [ 
		writer := PRTemplatedWriter new
			outputDocument: self;
			defaultWriter: writer;
			yourself ].
	^ writer
]
