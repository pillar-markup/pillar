Class {
	#name : #PRExportPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'inputFile',
		'syntaxLabel',
		'syntaxInput',
		'parser',
		'formatLabel',
		'formatInput',
		'target',
		'directoryLabel',
		'directoryText',
		'directorySearchButton',
		'project',
		'nameLabel',
		'nameInput',
		'name',
		'confirmButton',
		'cancelButton'
	],
	#category : #'Pillar-RichTextRenderer-spec2'
}

{ #category : #specs }
PRExportPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical 
			add: (SpBoxLayout newHorizontal	add: #syntaxLabel; add: #syntaxInput) withConstraints: [:c | c height: self toolbarHeight ];
			add: (SpBoxLayout newHorizontal	add: #formatLabel; add: #formatInput) withConstraints: [:c | c height: self toolbarHeight ];
			add: (SpBoxLayout newHorizontal	add: #directoryLabel; add: #directoryText; add: #directorySearchButton) withConstraints: [:c | c height: self toolbarHeight ];
			add: (SpBoxLayout newHorizontal	add: #nameLabel; add: #nameInput) withConstraints: [:c | c height: self toolbarHeight ];
			add: (SpBoxLayout newHorizontal	add: #cancelButton; add: #confirmButton) withConstraints: [:c | c height: self toolbarHeight ];
		yourself.
]

{ #category : #examples }
PRExportPresenter class >> open [
	<example>
	self new openDialogWithSpec
]

{ #category : #'as yet unclassified' }
PRExportPresenter class >> withInputFile: aFileReference withParser: aParser [
	^ self new inputFile: aFileReference; parser: aParser; yourself
]

{ #category : #initialization }
PRExportPresenter >> connectPresenters [
	self parser: syntaxInput selectedItem parser.
	
	self target: formatInput selectedItem.
	
	directorySearchButton action: [ 
		FDOpenDirectoryDialog new 
			whenSelected: [ :selectedDirectory | 
				self project: (PRProject on: selectedDirectory).
				directoryText text: selectedDirectory basename
			];
			openWithSpec
	].
	
	self name: nameInput text.
	
	cancelButton action: [ self delete ].
	
	confirmButton action: [ self exportAction. self delete ].
	

]

{ #category : #actions }
PRExportPresenter >> exportAction [
	"| conf |"
	self project installArchetypeNamed: 'book'.
	"conf := (self inputFile parent / 'pillar.conf').
	conf exists ifFalse: [ 
		conf ensureCreateFile.
		conf writeStreamDo: [ :st | st nextPutAll: self defaultConfig ]
		 ]."
	self target buildOnly: self inputFile asArray ; buildWithClapArguments: self project
]

{ #category : #list }
PRExportPresenter >> formatList [
	^ PRWritingTarget subclasses collect: [ :class | class new ]
]

{ #category : #initialization }
PRExportPresenter >> initialExtent [
	^ 500@200
]

{ #category : #initialization }
PRExportPresenter >> initializePresenters [
	syntaxLabel := self newLabel label: 'Input syntax:'.
	syntaxInput := SpLabelledDropList new
		items: self syntaxList;
		display: [ :item | item name asString ].
	
	formatLabel := self newLabel label: 'Export format:'.
	formatInput := SpLabelledDropList new
		items: self formatList;
		display: [ :item | item extension asString ].
	
	directoryLabel := self newLabel label: 'Output directory:'.
	directoryText := self newTextInput text: '...'; enabled: false.
	directorySearchButton := self newButton icon: (self iconNamed: #glamorousFolderIcon).
	
	nameLabel := self newLabel label: 'Name of final file: '.
	nameInput := self newTextInput placeholder: 'type your output name (without extension)'.
	
	cancelButton := self newButton label: 'Cancel'.
	confirmButton := self newButton label: 'Export'.
	
	self focusOrder 
		add: syntaxLabel; add: syntaxInput;
		add: formatLabel; add: formatInput;
		add: directoryLabel; add: directoryText; add: directorySearchButton;
		add: nameLabel; add: nameInput;
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
PRExportPresenter >> name [
	^ name ifNil: [ ^ self inputFile basename ]
]

{ #category : #accessing }
PRExportPresenter >> name: aString [
	name := aString
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

{ #category : #list }
PRExportPresenter >> syntaxList [
	^ PRSyntaxState subclasses collect: [ :class | class new ]
]

{ #category : #accessing }
PRExportPresenter >> target [
	^ target
]

{ #category : #accessing }
PRExportPresenter >> target: aWritingTarget [
	target := aWritingTarget 
]
