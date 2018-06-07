Class {
	#name : #PRAbstractOutputDocument,
	#superclass : #Object,
	#instVars : [
		'project',
		'file',
		'target',
		'outputDirectory'
	],
	#category : 'Pillar-ExporterCore-Base'
}

{ #category : #accessing }
PRAbstractOutputDocument >> baseDirectory [
	
	^ project baseDirectory
]

{ #category : #building }
PRAbstractOutputDocument >> buildOn: aPRProject [ 
	
	| parsedDocument transformedDocument writtenFile |
	parsedDocument := self parseInputFile: file.
	transformedDocument := self transformDocument: parsedDocument.
	writtenFile := self writeDocument: transformedDocument.
	self postWriteTransform: writtenFile.
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

{ #category : #building }
PRAbstractOutputDocument >> getMustacheTemplateValuesFromDocument: aDocument [
	| templates content |
	"We get the flattened meta-data obtained from the file header and the pillar configuration
	We add the text contents to the dictionary.
	This dictionary will be used by the mustache"
	content := self writer write: aDocument.
	templates := (self metadataConfigurationForDocument: aDocument) allProperties.
	templates at: #content put: content.
	^ templates
]

{ #category : #accessing }
PRAbstractOutputDocument >> inputFile [
	
	^ file file
]

{ #category : #accessing }
PRAbstractOutputDocument >> metadataConfigurationForDocument: aDocument [ 
	
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

{ #category : #writing }
PRAbstractOutputDocument >> templateFile [
	
	^ project baseDirectory / (self writer templateForConfiguration: project configuration)
]

{ #category : #building }
PRAbstractOutputDocument >> transformDocument: aDocument [

	| inclusionVisitor withInclusions |
	inclusionVisitor := PRFileInclusion new.
	inclusionVisitor topFile: file file.
	withInclusions := inclusionVisitor start: (PRCleanAnnotationInParagraphTransfomer new start: aDocument).

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

	| templateValues templatedOutput outputFile |
	
	templateValues := self getMustacheTemplateValuesFromDocument: aDocument.

	templatedOutput := (MustacheTemplate on: self templateFile readStream contents) value: templateValues.
	
	outputFile := (self outputDirectory resolve: (file file relativeTo: project baseDirectory asAbsolute)) withoutExtension , self extension.
	outputFile ensureDelete.
	outputFile parent ensureCreateDirectory.
	outputFile writeStreamDo: [ :stream | stream nextPutAll: templatedOutput ].
	^ outputFile
]

{ #category : #accessing }
PRAbstractOutputDocument >> writer [
	
	self subclassResponsibility
]
