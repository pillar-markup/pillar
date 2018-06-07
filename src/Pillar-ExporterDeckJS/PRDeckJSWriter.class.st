"
I'm a writer generating Deck.js slides from a Pillar document. Deck.js is a javascript framework specialized in slide creation.

To generate the internalLinks I use an anchorMapping to know the number of the slide where is the anchor.
"
Class {
	#name : #PRDeckJSWriter,
	#superclass : #PRHTMLWriter,
	#instVars : [
		'anchorMapping'
	],
	#category : 'Pillar-ExporterDeckJS'
}

{ #category : #accessing }
PRDeckJSWriter class >> writerName [
	^ #deckJS
]

{ #category : #'visiting-document' }
PRDeckJSWriter >> addAnchorFrom: anInternalLink To: href [
	| anchor |
	anchor := anchorMapping
		at: anInternalLink anchor
		ifPresent: [ :num | (num - 1) asString	"We do -1 because the first slide have an anchor with 0 and not 1" ]
		ifAbsent: [ 
			PRReferenceNotFound signal: 'Can''t find anchor named ''' , anInternalLink anchor , ''''.
			'' ].
	^ href , '#slide-' , anchor
]

{ #category : #private }
PRDeckJSWriter >> createNewSlideTitle: aTitle [
	canvas tag
		name: 'h2';
		with: aTitle.
	canvas newLine
]

{ #category : #visiting }
PRDeckJSWriter >> start: aDocument [
	anchorMapping := PRAssociateAnchorToSlideNumber new
		configuration: self configuration;
		start: aDocument.
	super start: aDocument
]

{ #category : #templating }
PRDeckJSWriter >> templateForConfiguration: aConfiguration [
	^ '_support/templates/presentation.deckjs.template'
]

{ #category : #templating }
PRDeckJSWriter >> templateForContext: aPillarContext [
	^ '_support/templates/presentation.deckjs.template'
]

{ #category : #'visiting-document' }
PRDeckJSWriter >> visitAnchor: anAnchor [
	"I do nothing because the anchors created by the user doesn't work with Deck.js."

	
]

{ #category : #'visiting-document' }
PRDeckJSWriter >> visitHeader: aHeader [

	self configuration renderStructureAsSlide
		ifTrue: [ 
			canvas tag
				name: 'div';
				parameterAt: 'class' put: 'slide';
				with: [ 
							canvas newLine.
							super visitHeader: aHeader ].
			canvas newLine ]
]

{ #category : #'visiting-document' }
PRDeckJSWriter >> visitSection: aSection [
	"Sections should not be render in a Deck.js file because it breack the transitions."

	self visitDocumentGroup: aSection
]

{ #category : #'visiting-document' }
PRDeckJSWriter >> visitSlide: aSlide [
	canvas tag
		name: 'div';
		parameterAt: 'class' put: 'slide';
		with: [ 
					canvas newLine.
					aSlide hasLabel
						ifTrue: [ 
							self createAnchorWith: aSlide label.
							canvas newLine ].
					self createNewSlideTitle: aSlide title.
					super visitSlide: aSlide ].
	canvas newLine
]
