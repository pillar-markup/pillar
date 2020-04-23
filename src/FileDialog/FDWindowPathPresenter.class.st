"
I provide a windowPathEditor 

API

* currentDirectory:  aFileReference
	see example class side 
	
* presenterUI: theUIUsingThisPresenter
	you have to send this message see 
	example (  )
		 MyUi >> initializeWidget
			...
			maVar := self instantiate: FDWindowPathPresenter.
			maVar presenterUI: self.
			...
			
UI using this widget have to define openOn: aFileReference
	
"
Class {
	#name : #FDWindowPathPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'textInput',
		'edditButton',
		'currentDirectory',
		'pathButtons',
		'presenterUI',
		'isTextInput'
	],
	#category : #'FileDialog-UI'
}

{ #category : #specs }
FDWindowPathPresenter class >> defaultSpec [
	^ SpBoxLayout newHorizontal
		add: #pathButtons;
		add: #edditButton withConstraints: [:contraint |contraint width: 30];
		yourself
]

{ #category : #examples }
FDWindowPathPresenter class >> example [
	<example>
	^ self new
		currentDirectory: FileLocator imageDirectory;
		openWithSpec
]

{ #category : #specs }
FDWindowPathPresenter class >> otherlayout [
	^ SpBoxLayout newHorizontal
		add: #textInput withConstraints: [:contraint | contraint spec: #fDLayoutFileDialog]; 
		add: #edditButton withConstraints: [:contraint |contraint width: 30 ];
		yourself
]

{ #category : #factory }
FDWindowPathPresenter >> creatButtonWith: aFileReference [
	^ SpButtonPresenter new
		label: aFileReference basename;
		action: [ currentDirectory := aFileReference.
			textInput entityText text: currentDirectory fullName.
			presenterUI openOn: currentDirectory ];
		yourself
]

{ #category : #accessing }
FDWindowPathPresenter >> currentDirectory [
	^ currentDirectory
]

{ #category : #api }
FDWindowPathPresenter >> currentDirectory: aFileReference [
	currentDirectory := aFileReference.
	self updatePathInputWith: aFileReference.
	pathButtons items: #() asOrderedCollection.
	currentDirectory fullPath withParents
		do: [ :eachAbsolutePath | pathButtons add: (self creatButtonWith: eachAbsolutePath) ].
	self needRebuild: false.
	self buildWithSpec
]

{ #category : #accessing }
FDWindowPathPresenter >> entityText [
	^ textInput entityText
]

{ #category : #initialization }
FDWindowPathPresenter >> initializeWidgets [
	isTextInput := false.
	textInput := self instantiate: SpSelectEntity.
	pathButtons := self newButtonBar.
	edditButton := self newButton.
	textInput entityText autoAccept: false.
	textInput placeholder: 'give/me/a/path'.
	edditButton
		icon: (self iconNamed: #edit);
		action: [ self needRebuild: false.
			self
				buildWithSpecLayout:
					(isTextInput
						ifTrue: [ self class defaultSpec ]
						ifFalse: [ self class otherlayout ]).
			isTextInput := isTextInput not ]
]

{ #category : #accessing }
FDWindowPathPresenter >> isTextInput [
	^ isTextInput
]

{ #category : #accessing }
FDWindowPathPresenter >> pathButtons [
	^ pathButtons
]

{ #category : #accessing }
FDWindowPathPresenter >> presenterUI [
	^ presenterUI
]

{ #category : #accessing }
FDWindowPathPresenter >> presenterUI: anObject [
	presenterUI := anObject
]

{ #category : #api }
FDWindowPathPresenter >> updatePathInputWith: aFileReference [
	textInput possibleEntities: (aFileReference children collect: #fullName).
	textInput entityText text: aFileReference fullName
]
