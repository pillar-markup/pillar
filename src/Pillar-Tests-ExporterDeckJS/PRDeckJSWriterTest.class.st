Class {
	#name : #PRDeckJSWriterTest,
	#superclass : #PRHTMLWriterTest,
	#traits : 'PRTSliderWriterTest',
	#classTraits : 'PRTSliderWriterTest classTrait',
	#category : #'Pillar-Tests-ExporterDeckJS'
}

{ #category : #private }
PRDeckJSWriterTest >> actualClass [
	^ PRDeckJSWriter
]

{ #category : #requirements }
PRDeckJSWriterTest >> endSlideTag [
	^ '</div>'
]

{ #category : #requirements }
PRDeckJSWriterTest >> headerInSlide [
	"I return one string that define a header rendering in a slide."

	^ '<h1>'
]

{ #category : #accessing }
PRDeckJSWriterTest >> packageNamesUnderTest [
	^ #('Pillar-ExporterDeckJS')
]

{ #category : #requirements }
PRDeckJSWriterTest >> representationOfAnchor [
	"I return a string which reprensent an anchor in the slider format."

	^ '<a id="'
]

{ #category : #results }
PRDeckJSWriterTest >> resultWithRefWithAnchorWithSeparateOutputFiles [
	^ '#slide-0'
]

{ #category : #results }
PRDeckJSWriterTest >> resultWithoutAliasWithoutRefWithAnchorWithSeparateOutputFiles [
	^ '#slide-0'
]

{ #category : #results }
PRDeckJSWriterTest >> resultWithoutRefWithAnchorWithSeparateOutputFiles [
	^ '#slide-0'
]

{ #category : #requirements }
PRDeckJSWriterTest >> slideRepresentation [
	^ {'<div'.
	'class'.
	'slide'.
	'</div>'}
]

{ #category : #requirements }
PRDeckJSWriterTest >> slideTitle [
	"I return a collection with an explicite rendering of a slide title."

	^ {'<h2>'.
	'Slide title'.
	'</h2>'}
]

{ #category : #tests }
PRDeckJSWriterTest >> testAnchor [
	"Anchors define by the user in deck.js doesn't work so we don't need to render them."

	| item |
	item := PRAnchor new name: 'foo'.
	self deny: ((self write: item) includesSubstring: 'id="foo"')
]
