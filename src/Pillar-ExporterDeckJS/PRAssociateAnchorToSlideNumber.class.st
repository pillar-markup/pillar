"
On Deck.js the anchor doesn't work the same as HTML. 
At each slide deck.js create an anchor named ""slide-X"" where X is the number of the slide (we begin at 0). 
I am a visitor, I will visit a document and return a Dictionary with all the anchors of a document in key and the number of the slide where is the anchor as value.

I work with the ""slideInTemplateForDeckJS"" configuration to know how many slides I have before the document in the template.

currentSlide is the number of the current slide.

anchorMapping is the dictionary of anchor/counter.

"
Class {
	#name : #PRAssociateAnchorToSlideNumber,
	#superclass : #PRVisitor,
	#instVars : [
		'currentSlide',
		'anchorMapping',
		'configuration'
	],
	#category : 'Pillar-ExporterDeckJS'
}

{ #category : #testing }
PRAssociateAnchorToSlideNumber class >> isAbstract [
	^ false
]

{ #category : #accessing }
PRAssociateAnchorToSlideNumber >> configuration [
	^ configuration ifNil: [ configuration := ConfigurationForPillar new ]
]

{ #category : #accessing }
PRAssociateAnchorToSlideNumber >> configuration: aConfiguration [
	configuration := aConfiguration
]

{ #category : #visiting }
PRAssociateAnchorToSlideNumber >> start: aDocument [
	currentSlide := self configuration slideInTemplateForDeckJS. "I do not understand what is this configuration property."
	anchorMapping := Dictionary new.
	super start: aDocument.
	^ anchorMapping
]

{ #category : #'visiting-document' }
PRAssociateAnchorToSlideNumber >> visitAnchor: anObject [
	anchorMapping at: anObject name put: currentSlide.
	super visitAnchor: anObject
]

{ #category : #'visiting-document' }
PRAssociateAnchorToSlideNumber >> visitCodeblock: aCodeBlock [
	aCodeBlock hasLabel
		ifTrue: [ anchorMapping at: aCodeBlock label put: currentSlide ].
	super visitCodeblock: aCodeBlock
]

{ #category : #'visiting-document' }
PRAssociateAnchorToSlideNumber >> visitFigure: anObject [
	anObject hasLabel
		ifTrue: [ anchorMapping at: anObject label put: currentSlide ].
	super visitFigure: anObject
]

{ #category : #'visiting-document' }
PRAssociateAnchorToSlideNumber >> visitHeader: aHeader [
	"If we create a slide when we have a header in DeckJS we need to increase the counter."

	self configuration renderStructureAsSlide
		ifTrue: [ currentSlide := currentSlide + 1 ].
	super visitHeader: aHeader
]

{ #category : #'visiting-document' }
PRAssociateAnchorToSlideNumber >> visitSlide: aSlide [
	currentSlide := currentSlide + 1.
	aSlide hasLabel
		ifTrue: [ anchorMapping at: aSlide label put: currentSlide ].
	super visitSlide: aSlide
]
