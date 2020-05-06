"
I am a replacement tool for """"class"""" comments. 

I need to be refactored somehow as ==ClyPackageRichTextCommentEditorToolMorph== and ==ClyRichTextClassCommentEditorToolMorph== are basically identical
"
Class {
	#name : #ClyRichTextClassCommentEditorToolMorph,
	#superclass : #ClyClassCommentEditorToolMorph,
	#instVars : [
		'isRendering'
	],
	#category : #'Pillar-Calypso'
}

{ #category : #activation }
ClyRichTextClassCommentEditorToolMorph class >> classCommentTabActivation [ 
	"Do nothing - part of a hack for overriding the class comment tool in Calypso"
]

{ #category : #activation }
ClyRichTextClassCommentEditorToolMorph class >> classTabActivation [  
	"Do nothing - part of a hack for overriding the class comment tool in Calypso"
]

{ #category : #converting }
ClyRichTextClassCommentEditorToolMorph >> asRenderedText [
	"Assumes we are in view pillar source mode. editingText does not return a Text in case of working with RGComment. asText turns it into a Text, and asString into a string, which is what we expect. 
	If we have a real source code, asText asString is dummy and does not fail."
	^ PRRichTextComposer renderComment:  super editingText asText asString
]

{ #category : #rendering }
ClyRichTextClassCommentEditorToolMorph >> buildTextMorph [
	super buildTextMorph.
	self setBackgroundColor: self renderColor.
	self bindKeyCombination: $r command toAction: [ self toggleMode ].
	self disable 
]

{ #category : #rendering }
ClyRichTextClassCommentEditorToolMorph >> changesAccepted [
	| res |
	res := super changesAccepted.
	self switchToRenderMode.
	^res
]

{ #category : #actions }
ClyRichTextClassCommentEditorToolMorph >> disable [
	textMorph enabled: false
]

{ #category : #rendering }
ClyRichTextClassCommentEditorToolMorph >> editColor [
	^self theme backgroundColor 
]

{ #category : #rendering }
ClyRichTextClassCommentEditorToolMorph >> editingText [
	^ isRendering 
		ifTrue: [ self asRenderedText ]
		ifFalse: [ super editingText ]
]

{ #category : #actions }
ClyRichTextClassCommentEditorToolMorph >> enable [
	textMorph enabled: true
]

{ #category : #initialization }
ClyRichTextClassCommentEditorToolMorph >> initialize [
	super initialize.
	isRendering := true.

]

{ #category : #rendering }
ClyRichTextClassCommentEditorToolMorph >> renderColor [
	self theme backgroundColor lightness < 0.5
		ifTrue: [ ^ self theme backgroundColor + (Color r: 0.0 g: 0.04 b:0.08 )]
		ifFalse: [ ^self theme backgroundColor darker ]
]

{ #category : #rendering }
ClyRichTextClassCommentEditorToolMorph >> setBackgroundColor: aColor [
	"Convenience method to set my background color"
	textMorph color: aColor
	
]

{ #category : #actions }
ClyRichTextClassCommentEditorToolMorph >> switchToEditMode [
	isRendering := false.
	self enable.
	self setBackgroundColor: (self editColor ).
	self triggerUpdate
]

{ #category : #actions }
ClyRichTextClassCommentEditorToolMorph >> switchToRenderMode [
	self hasUnacceptedEdits
		ifTrue: [ ^ self ].
	isRendering := true.
	self setBackgroundColor: (self renderColor ).
	self disable.
	self triggerUpdate
]

{ #category : #actions }
ClyRichTextClassCommentEditorToolMorph >> toggleMode [
	isRendering
		ifTrue: [ self switchToEditMode ]
		ifFalse: [ self switchToRenderMode ]
]
