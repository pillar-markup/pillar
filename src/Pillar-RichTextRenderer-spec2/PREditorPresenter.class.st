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
		'parser'
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
	textInput text: ''.
	textOutput text: ''
]

{ #category : #accessing }
PREditorPresenter >> currentFile [
	^ currentFile ifNil: [ ^ currentFile := FDSaveFileDialog new openModal ]
]

{ #category : #accessing }
PREditorPresenter >> currentFileName [
	^ currentFile ifNil: [ ^ 'New File' ] ifNotNil: [ ^ currentFile basename]
]

{ #category : #actions }
PREditorPresenter >> exampleAction [
	textInput text: syntaxState exampleText.
	textOutput text: ''.
]

{ #category : #initialization }
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
		initialExtent: self initialExtent;
		windowIcon: (self iconNamed: #glamorousBrowseIcon)
]

{ #category : #api }
PREditorPresenter >> menu [
	^ menu ifNil: [ ^ menu := self newMenuBar
		addGroup: [ :group | 
			group 
				addItem: [ :item | 
					item
						name: 'New';
						description: 'New document';
						icon: (self iconNamed: #pageIcon);
						action: [ self newDocAction ] ].
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
						action: [ self saveAction ] ].
			group 
				addItem: [ :item | 
					item
						name: 'Clean';
						description: 'Erase input text';
						icon: (self iconNamed: #smallCancel);
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
						icon: (self iconNamed: #smallDoItIcon);
						action: [ self exampleAction ] ].
			group
				addItem: [ :item | 
					item
						name: 'Change input syntax';
						description: 'Switch with MicroDown or Pillar';
						icon: (self iconNamed: #changeUpdateIcon);
						action: [ self changeAction ] 
				]	
		]; yourself ]
]

{ #category : #actions }
PREditorPresenter >> newDocAction [
	self cleanAction.
	currentFile := nil.
	self updateTitle
]

{ #category : #actions }
PREditorPresenter >> openAction [
	| openFileDialog |
	openFileDialog := FDOpenFileDialog new whenSelected: [
		:selectedFile |
			currentFile := selectedFile.
			textInput text: selectedFile contents.
			textOutput text: ''.
			self updateTitle
		].
	openFileDialog openWithSpec 
]

{ #category : #actions }
PREditorPresenter >> renderAction [
	| document |
	document := parser new parse: textInput text.
	textOutput text: (morphWriter start: document) 
]

{ #category : #actions }
PREditorPresenter >> saveAction [
	self currentFile writeStreamDo: [ 
		:str | str nextPutAll: textInput text asString; truncate: textInput text asString size 
	].
	self updateTitle.
	self inform: self currentFile fullName, ' is saved'
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
	^ 'Pillar Editor - ', self currentFileName
]

{ #category : #api }
PREditorPresenter >> updateTitle [
	self window title: self title.
]
