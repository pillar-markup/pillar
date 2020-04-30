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
PRExportPresenter class >> withInputFile: aFileReference withParser: aParser [
	^ self basicNew inputFile: aFileReference; parser: aParser; initialize; yourself
]

{ #category : #initialization }
PRExportPresenter >> connectPresenters [
	
	self target: formatInput selectedItem.
	
	cancelButton action: [ self delete ].
	
	confirmButton action: [ self exportAction. self delete ].
	

]

{ #category : #actions }
PRExportPresenter >> exportAction [
	self project installArchetypeNamed: 'book'.
	self target buildOnly: self inputFile asArray ; buildWithClapArguments: self project
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
