Class {
	#name : #PRRenderingPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'textInput',
		'textResult',
		'parseButton',
		'morphWriter'
	],
	#category : #'Pillar-RichTextRenderer'
}

{ #category : #specs }
PRRenderingPresenter class >> defaultSpec [
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
PRRenderingPresenter >> initialExtent [
	^ 800@400
]

{ #category : #initialization }
PRRenderingPresenter >> initialize [
	super initialize.
	morphWriter := PRRichTextComposer.
]

{ #category : #initialization }
PRRenderingPresenter >> initializePresenter [
	| |
	parseButton action: [ 
		textResult text: ''.
		textResult text: (morphWriter asText: textInput text) ].
]

{ #category : #initialization }
PRRenderingPresenter >> initializeWidgets [ 
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
PRRenderingPresenter >> parseButton [
	^ parseButton
]

{ #category : #accessing }
PRRenderingPresenter >> parseButton: anObject [
	parseButton := anObject
]

{ #category : #accessing }
PRRenderingPresenter >> textInput [
	^ textInput
]

{ #category : #accessing }
PRRenderingPresenter >> textInput: anObject [
	textInput := anObject
]

{ #category : #accessing }
PRRenderingPresenter >> textResult [
	^ textResult
]

{ #category : #accessing }
PRRenderingPresenter >> textResult: anObject [
	textResult := anObject
]

{ #category : #api }
PRRenderingPresenter >> title [
	^ 'Pillar RichText-based Renderer'
]
