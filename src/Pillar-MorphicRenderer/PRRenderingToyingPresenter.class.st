"
PRRenderingToyingPresenter new openWithSpec.
"
Class {
	#name : #PRRenderingToyingPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'textInput',
		'textResult',
		'parseButton',
		'morphWriter'
	],
	#category : #'Pillar-MorphicRenderer'
}

{ #category : #specs }
PRRenderingToyingPresenter class >> defaultSpec [
	^ SpecRowLayout new
		add: #textResult width: 400;
		newColumn: [ :col | 
			col 
				add: #textInput;
				add: #parseButton;
				yourself
		];
		yourself.
]

{ #category : #api }
PRRenderingToyingPresenter >> initialExtent [
	^ 800@400
]

{ #category : #initialization }
PRRenderingToyingPresenter >> initialize [
	super initialize.
	morphWriter := PRMorphWriter new.
]

{ #category : #initialization }
PRRenderingToyingPresenter >> initializePresenter [
	| document |
	parseButton action: [ 
		textResult text: ''.
		document := PRPillarParser new parse: textInput text.
		morphWriter start: document.
		textResult text: morphWriter text ].
]

{ #category : #initialization }
PRRenderingToyingPresenter >> initializeWidgets [ 
	self instantiateModels: #(textResult TextPresenter).
	textResult text: ''.
	self instantiateModels: #(textInput TextPresenter).
	textInput 
		autoAccept: true;
		text: PRMorphWriter pillarInputExample.
	self instantiateModels: #(parseButton ButtonPresenter).
	parseButton label: 'Parse'.
]

{ #category : #accessing }
PRRenderingToyingPresenter >> parseButton [
	^ parseButton
]

{ #category : #accessing }
PRRenderingToyingPresenter >> parseButton: anObject [
	parseButton := anObject
]

{ #category : #accessing }
PRRenderingToyingPresenter >> textInput [
	^ textInput
]

{ #category : #accessing }
PRRenderingToyingPresenter >> textInput: anObject [
	textInput := anObject
]

{ #category : #accessing }
PRRenderingToyingPresenter >> textResult [
	^ textResult
]

{ #category : #accessing }
PRRenderingToyingPresenter >> textResult: anObject [
	textResult := anObject
]

{ #category : #api }
PRRenderingToyingPresenter >> title [
	^ 'Pillar Renderer'
]
