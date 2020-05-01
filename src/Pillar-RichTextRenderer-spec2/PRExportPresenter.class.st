Class {
	#name : #PRExportPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'inputFile',
		'syntaxScreen',
		'parser',
		'formatLabel',
		'formatInput',
		'target',
		'directoryScreen',
		'project',
		'configDirectory',
		'confirmButton',
		'cancelButton'
	],
	#category : #'Pillar-RichTextRenderer-spec2'
}

{ #category : #specs }
PRExportPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical 
			add: (SpBoxLayout newHorizontal	add: #formatLabel; add: #formatInput) withConstraints: [:c | c height: self toolbarHeight ];
			add: #syntaxScreen withConstraints: [:c | c height: self toolbarHeight ];
			add: #directoryScreen withConstraints: [:c | c height: self toolbarHeight ];
			add: (SpBoxLayout newHorizontal	add: #cancelButton; add: #confirmButton) withConstraints: [:c | c height: self toolbarHeight ];
		yourself.
]

{ #category : #examples }
PRExportPresenter class >> open [
	<example>
	self new openDialogWithSpec
]

{ #category : #creation }
PRExportPresenter class >> withInputFile: aFileReference withParser: aParser withConfigDirectory: aDirectory [
	^ self basicNew inputFile: aFileReference; parser: aParser; configDirectory: aDirectory; initialize; yourself
]

{ #category : #accessing }
PRExportPresenter >> configDirectory [
	^ configDirectory 
]

{ #category : #accessing }
PRExportPresenter >> configDirectory: aDirectory [
	configDirectory := aDirectory
]

{ #category : #initialization }
PRExportPresenter >> connectPresenters [
	
	cancelButton action: [ self delete ].
	
	confirmButton action: [ 
		self target: formatInput selectedItem.
		self exportAction. 
		self delete ].
	

]

{ #category : #actions }
PRExportPresenter >> exportAction [
	| inputFileDirectory |
	self project installArchetypeNamed: 'book' fromDirectory: (self configDirectory / 'archetypes' / 'book') asFileReference.
	self target buildOnly: self inputFile asArray ; buildOn: self project.
	"delete temp files created"
	inputFileDirectory := self inputFile parent.
	(inputFileDirectory / 'Chapters') deleteAll.
	(inputFileDirectory / '_support') deleteAll.
	(inputFileDirectory / 'index.pillar') delete.
	(inputFileDirectory / 'pillar.conf') delete.
	self inform: self inputFile basename, 'is exported!'
]

{ #category : #list }
PRExportPresenter >> formatList [
	^ PRWritingTarget subclasses collect: [ :class | class new ]
]

{ #category : #initialization }
PRExportPresenter >> initialExtent [
	^ 600@200
]

{ #category : #initialization }
PRExportPresenter >> initializePresenters [
	
	formatLabel := self newLabel label: 'Export format:'.
	formatInput := SpLabelledDropList new
		items: self formatList;
		display: [ :item | item extension asString ].
	
	syntaxScreen := self newLabel label: 'Input syntax: ', self parser name.
	directoryScreen := self newLabel label: 'Final export directory: ', self inputFile fullName, '\_result'.
	
	cancelButton := self newButton label: 'Cancel'.
	confirmButton := self newButton label: 'Export'.
	
	self focusOrder 
		add: formatLabel; add: formatInput;
		add: syntaxScreen; add: directoryScreen;
		add: cancelButton; add: confirmButton
]

{ #category : #initialization }
PRExportPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter
		title: 'Export';
		initialExtent: self initialExtent
]

{ #category : #accessing }
PRExportPresenter >> inputFile [
	"required at creation"
	^inputFile
]

{ #category : #accessing }
PRExportPresenter >> inputFile: aFile [
	inputFile := aFile
]

{ #category : #accessing }
PRExportPresenter >> parser [
	"required at creation"
	^ parser
]

{ #category : #accessing }
PRExportPresenter >> parser: aParser [
	parser := aParser
]

{ #category : #accessing }
PRExportPresenter >> project [
	^ project ifNil: [ ^ PRProject on: self inputFile parent ]
]

{ #category : #accessing }
PRExportPresenter >> project: aPRProject [
	project := aPRProject 
]

{ #category : #accessing }
PRExportPresenter >> target [
	^ target
]

{ #category : #accessing }
PRExportPresenter >> target: aWritingTarget [
	target := aWritingTarget 
]
