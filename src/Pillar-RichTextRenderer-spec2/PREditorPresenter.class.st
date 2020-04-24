"
PREditorPresenter new openWithSpec
"
Class {
	#name : #PREditorPresenter,
	#superclass : #SpApplicationWithToolbar,
	#instVars : [
		'syntaxState',
		'screen',
		'textInput',
		'textOutput',
		'currentFile',
		'morphWriter',
		'parser',
		'currentFile'
	],
	#category : #'Pillar-RichTextRenderer-spec2'
}

{ #category : #specs }
PREditorPresenter class >> defaultSpec [
	"^ SpBoxLayout newVertical
		add: (SpBoxLayout newHorizontal
			add: #changeButton ;
			add: #parseButton ;
		yourself) height: 30;
		add: #screen withConstraints: [:c | c expand: false];
		add: (SpBoxLayout newHorizontal
			add: #textInput;
			add: #textOutput;
		yourself);
yourself"
	 ^ SpBoxLayout newVertical
		add: #menu withConstraints: [ :constraints | constraints height: self toolbarHeight ];
		add: #screen withConstraints: [:c | c expand: false];
		add: (SpBoxLayout newHorizontal
			add: #textInput;
			add: #textOutput;
		yourself);
	yourself
]

{ #category : #examples }
PREditorPresenter class >> open [
	<example>
	^ self new openWithSpec
]

{ #category : #actions }
PREditorPresenter >> changeAction [
	syntaxState := syntaxState next new.
	parser := syntaxState parser.
	self screenLabelWith: syntaxState name.
]

{ #category : #actions }
PREditorPresenter >> cleanAction [
	textInput text: ''
]

{ #category : #actions }
PREditorPresenter >> exampleAction [
	textInput text: syntaxState exampleText.
	textOutput text: ''.
]

{ #category : #accessing }
PREditorPresenter >> initialExtent [
	^ 800@600
]

{ #category : #initialization }
PREditorPresenter >> initializePresenters [
	morphWriter := PRRichTextComposer new.
	syntaxState := PRPillarState new.
	parser := syntaxState parser.

	self menu applyTo: self.
	
	textInput := self newText.
	textInput 
		autoAccept: true; 
		text: '% Type your marked-up text here. Render it and see right the output generated as rich text', String cr, String cr, syntaxState exampleText.
	
	textOutput := self newText.
	textOutput text: ''.
	
	self focusOrder add: textInput.
	self focusOrder add: textOutput.

	screen :=  self newLabel.
	self screenLabelWith: syntaxState name.
	self focusOrder add: screen.
]

{ #category : #initialization }
PREditorPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter
		title: self title;
		initialExtent: self initialExtent
]

{ #category : #accessing }
PREditorPresenter >> menu [
	^ menu ifNil: [ ^ menu := self newMenuBar
		addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: 'Open';
						description: 'Open file';
						shortcut: $o meta;
						icon: (self iconNamed: #openIcon);
						action: [ self openAction ] ].
			group
				addItem: [ :item | 
					item
						name: 'Save';
						description: 'Save file';
						shortcut: $s meta;
						icon: (self iconNamed: #smallSaveIcon);
						action: [ self inform: 'Save File' ] ].
			group 
				addItem: [ :item | 
					item
						name: 'Clean';
						icon: (self iconNamed: #smallCancelIcon);
						action: [ self cleanAction ] ] ];
		addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: 'Render';
						icon: (self iconNamed: #smallFindIcon);
						description: 'Render your input text';
						action: [ self renderAction	]
				].
			group
				addItem: [ :item | 
					item
						name: 'Get example';
						description: 'Give a text input example in current syntax';
						action: [ self exampleAction ] ].
			group
				addItem: [ :item | 
					item
						name: 'Change input syntax';
						description: 'Switch with MicroDown or Pillar';
						action: [ self changeAction ] 
				]	
		]; yourself ]
]

{ #category : #actions }
PREditorPresenter >> openAction [
	| openFileDialog |
	openFileDialog := FDOpenFileDialog new okActionBlock: [
		:selectedFile |
			currentFile := selectedFile.
			textInput text: selectedFile contents.
			textOutput text: ''		
		].
	openFileDialog openDialogWithSpec 
]

{ #category : #actions }
PREditorPresenter >> renderAction [
	| document |
	document := parser new parse: textInput text.
	textOutput text: (morphWriter start: document) 
]

{ #category : #api }
PREditorPresenter >> screenLabelWith: aName [
	screen label: 'Your current syntax is: ', aName string
]

{ #category : #accessing }
PREditorPresenter >> textInputText: aStringOrNil [
	textInput text = aStringOrNil asString
]

{ #category : #accessing }
PREditorPresenter >> title [
	^ 'Pillar RichText-based Editor'
]
