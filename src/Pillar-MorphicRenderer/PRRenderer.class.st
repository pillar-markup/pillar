Class {
	#name : #PRRenderer,
	#superclass : #Object,
	#category : #'Pillar-MorphicRenderer'
}

{ #category : #working }
PRRenderer class >> example [
	"self new example"
	<example>
	| writer |
	writer :=PRMorphWriter new
		visit: (self exampleDocument).
	writer text asMorph openInWindow.
	^ writer
]

{ #category : #working }
PRRenderer class >> example2 [
	"self new example2"
	<example>
	| writer |
	writer := PRMorphWriter2 new.
	writer visit: (self exampleDocument).
	writer text asMorph openInWindow.
	^ writer
]

{ #category : #'not working' }
PRRenderer class >> example3 [
	"self new example3"
	<example>
	| writer numerator document |
	
	writer := PRMorphWriter2 new.
	numerator := (PRNumeratingVisitor new configuration: writer configuration).

	document := PRRenderer exampleDocument.
	numerator visit: document.
	writer start: document.

	writer text asMorph openInWindow.
	^ writer
]

{ #category : #working }
PRRenderer class >> exampleDocument [

	^ PRPillarParser new parse: self pillarInputExample
]

{ #category : #'as yet unclassified' }
PRRenderer class >> pillarInputExample [
	^ '! Heading one 

!!Heading Twoo 

""this is bold""

this is not not bold 

this is a list
- item 1 ""this is bold again my friend""
- item 2

[[[language=smalltalk 
1 + 2 
]]]

! Heading one 

'
]
