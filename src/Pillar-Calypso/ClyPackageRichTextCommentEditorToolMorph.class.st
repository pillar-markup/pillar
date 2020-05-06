"
I am a replacement for the """"package comments"""" tool.


I need to be refactored somehow as ==ClyPackageRichTextCommentEditorToolMorph== and ==ClyRichTextClassCommentEditorToolMorph== are basically identical
"
Class {
	#name : #ClyPackageRichTextCommentEditorToolMorph,
	#superclass : #ClyPackageCommentEditorToolMorph,
	#instVars : [
		'isRendering'
	],
	#category : #'Pillar-Calypso'
}

{ #category : #activation }
ClyPackageRichTextCommentEditorToolMorph class >> browserTabActivation [  
	"Do nothing - part of a hack for overriding the class package tool in Calypso"
]

{ #category : #activation }
ClyPackageRichTextCommentEditorToolMorph class >> browserTabActivation2 [  
	"Do nothing - part of a hack for overriding the class package tool in Calypso"
]

{ #category : #converting }
ClyPackageRichTextCommentEditorToolMorph >> asRenderedText [
	^ PRRichTextComposer renderComment:  super editingText asText asString
]

{ #category : #rendering }
ClyPackageRichTextCommentEditorToolMorph >> buildTextMorph [
	super buildTextMorph.
	self setBackgroundColor: self renderColor.
	self bindKeyCombination: $r command toAction: [ self toggleMode ].
	self disable.
]

{ #category : #rendering }
ClyPackageRichTextCommentEditorToolMorph >> changesAccepted [
	| res |
	res := super changesAccepted.
	self switchToRenderMode.
	^res
]

{ #category : #actions }
ClyPackageRichTextCommentEditorToolMorph >> disable [
	textMorph enabled: false
]

{ #category : #rendering }
ClyPackageRichTextCommentEditorToolMorph >> editColor [
	^self theme backgroundColor 
]

{ #category : #acccessing }
ClyPackageRichTextCommentEditorToolMorph >> editingText [
	^ isRendering 
		ifTrue: [ self asRenderedText ]
		ifFalse: [ super editingText ]
]

{ #category : #actions }
ClyPackageRichTextCommentEditorToolMorph >> enable [
	textMorph enabled: true
]

{ #category : #initialization }
ClyPackageRichTextCommentEditorToolMorph >> initialize [
	super initialize.
	isRendering := true.

]

{ #category : #rendering }
ClyPackageRichTextCommentEditorToolMorph >> renderColor [
	self theme backgroundColor lightness < 0.5
		ifTrue: [ ^ self theme backgroundColor + (Color r: 0.0 g: 0.04 b:0.08 )]
		ifFalse: [ ^self theme backgroundColor darker ]
]

{ #category : #rendering }
ClyPackageRichTextCommentEditorToolMorph >> setBackgroundColor: aColor [
	"Convenience method to set my background color"
	textMorph color: aColor
	
]

{ #category : #actions }
ClyPackageRichTextCommentEditorToolMorph >> switchToEditMode [
	isRendering := false.
	self enable.
	self setBackgroundColor: (self editColor ).
	self triggerUpdate
]

{ #category : #actions }
ClyPackageRichTextCommentEditorToolMorph >> switchToRenderMode [
	self hasUnacceptedEdits
		ifTrue: [ ^ self ].
	isRendering := true.
	self setBackgroundColor: (self renderColor ).
	self disable.
	self triggerUpdate
]

{ #category : #actions }
ClyPackageRichTextCommentEditorToolMorph >> toggleMode [
	isRendering
		ifTrue: [ self switchToEditMode ]
		ifFalse: [ self switchToRenderMode ]
]
