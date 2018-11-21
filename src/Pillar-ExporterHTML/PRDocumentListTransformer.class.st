"
I am a tranformer in charge of transforming docList annotations. I just replace that annotation by  a document group containing an abstract of each file.

How To !!??
doc = PRDocument new.

((PRDocListTransformer withContext: (PRProject on: testingFileSystem)) start: doc).

"
Class {
	#name : #PRDocumentListTransformer,
	#superclass : #PRNodeTransformer,
	#instVars : [
		'workingDirectory',
		'currentFile',
		'filesDirectory',
		'availableTemplates'
	],
	#category : #'Pillar-ExporterHTML'
}

{ #category : #'instance-creation' }
PRDocumentListTransformer class >> withContext: aContext [

	| inst |
	inst := super withContext: aContext.
	inst workingDirectory: aContext baseDirectory.
	^ inst
]

{ #category : #adding }
PRDocumentListTransformer >> addAbstractOfCurrentFileToDocument: aDocument inAnnotation: aPRDocListAnnotation [
	| abstractOfCurrentFile |
	abstractOfCurrentFile := PRPillarParserMain parse: self currentFile contents.
	"arbitrary value for children"
	abstractOfCurrentFile
		setChildren: {(PRText content: (abstractOfCurrentFile text truncateWithElipsisTo: aPRDocListAnnotation summaryMaxSize))}.
	^ self availableTemplates
		ifNotEmpty: [ | previousContent |
			previousContent := aDocument text.
			aDocument
				text: previousContent , (self generateFileUsingTemplateFromDocument: abstractOfCurrentFile) ]
		ifEmpty: [ aDocument addAll: abstractOfCurrentFile children.
			self addLinkToDocument: aDocument ]
]

{ #category : #adding }
PRDocumentListTransformer >> addLinkToDocument: aDocument [
	aDocument
		add:
			((PRInternalLink reference: self filesDirectory , '/' , self currentFile basename)
				addAll: {(PRText content: 'Read more')};
				yourself)
]

{ #category : #accessing }
PRDocumentListTransformer >> availableTemplates [
	^ availableTemplates
]

{ #category : #transforming }
PRDocumentListTransformer >> createDocList: aPRDocListAnnotation [
	| files document sortedFiles |
	"Check if the specified path exist and get pillar files from it.
	Get some abstract of these pillar files. The final document is a DocumentGroup, but when templates
	are specified and exists It is a Raw HTML document"
	document := PRDocumentGroup new.
	
	availableTemplates := self lookForAvailableTemplates: aPRDocListAnnotation templates.
	self availableTemplates ifNotEmpty: [ document := PRRaw new text: '' ].
	
	filesDirectory := aPRDocListAnnotation path.
	(workingDirectory resolve: self filesDirectory) exists
		ifTrue: [ 
			files := (workingDirectory resolve: aPRDocListAnnotation path) files select: [ :each | each extension = 'pillar' ].
			sortedFiles := self sort: files limit: (aPRDocListAnnotation limit asInteger min: files size) by: aPRDocListAnnotation sort.
			
			1 to: (aPRDocListAnnotation limit asInteger min: sortedFiles size) do: [ :index | 
				currentFile := (sortedFiles at: index).
				
				"Parse current file and add an abstract to the general document"
				self addAbstractOfCurrentFileToDocument: document inAnnotation: aPRDocListAnnotation ] 
		].
	^ document
]

{ #category : #adding }
PRDocumentListTransformer >> currentDocumentInternalLink [
	
	^ PRInternalLink reference: self filesDirectory , '/' , self currentFile basename
]

{ #category : #visiting }
PRDocumentListTransformer >> currentFile [
	^ currentFile
]

{ #category : #accessing }
PRDocumentListTransformer >> filesDirectory [
	^ filesDirectory
]

{ #category : #parsing }
PRDocumentListTransformer >> generateFileUsingTemplateFromDocument: aDocument [
	| conf htmlDoc |
	"Read configurations"
	conf := ConfigurationForPillar newFromDictionary: aDocument properties.
	conf parent: self configuration.

	"Write the  document in HTML, It means that this template is only for HTML generation"
	conf at: #content put: (PRHTMLWriter write: aDocument).
	conf at: #link put: self currentDocumentInternalLink referenceAsHTML.
	
	htmlDoc := (MustacheTemplate on: (self workingDirectory resolve: self availableTemplates first) contents) value: conf.
	self availableTemplates add: availableTemplates first.
	self availableTemplates remove: availableTemplates first. 
	^ htmlDoc
]

{ #category : #accessing }
PRDocumentListTransformer >> lookForAvailableTemplates: aCollection [
	^ (aCollection select: [ :each | (self workingDirectory resolve: each) exists and: [ each asFileReference extension = 'mustache' ] ]) asOrderedCollection
]

{ #category : #sorting }
PRDocumentListTransformer >> sort: aCollectionOfReferences limit: anInteger by: aString [
	| references |
	references := aCollectionOfReferences first: anInteger.
	aString = 'date'
		ifTrue: [ ^ PRDocumentListDateSorter with: references ].
	aString = 'name'
		ifTrue: [ ^ PRDocumentListNameSorter with: references ].
	^ references
]

{ #category : #visiting }
PRDocumentListTransformer >> visitDocListAnnotation: aPRDocListAnnotation [

	self replace: { (self createDocList: aPRDocListAnnotation) }
]

{ #category : #accessing }
PRDocumentListTransformer >> workingDirectory [
	^ workingDirectory
]

{ #category : #accessing }
PRDocumentListTransformer >> workingDirectory: aFileReference [
	workingDirectory := aFileReference
]
