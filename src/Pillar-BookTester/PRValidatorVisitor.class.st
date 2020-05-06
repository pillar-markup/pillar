"
!! Preamble
Iceberg is a tool to manage git projects from Pharo. 
It makes the experience of managing code really smooth.
Iceberg evolved over the years.
A first version was introduced with Pharo 6.0.
A major effort went into the version of Iceberg presents in Pharo 7.0. 
We are using the version of Iceberg available in Pharo 8.0.

This document is under writing but we decided to release before its completion 
because managing code can be a large topic when we start to discuss workflow and process. 

The authors want to thank Sean de Nigris, Quentin Ducasse and Stefan Eggermont for the reviews and copy-edit of the early version. We also thank Peter Uhnak for his first blog on publishing Pharo code on Github.

${inputFile:path=Chapters/Started/started.pillar}$
${inputFile:path=Chapters/Started/extensions.pillar}$
${inputFile:path=Chapters/Started/services.pillar}$
${inputFile:path=Chapters/Started/pharo.pillar}$
${inputFile:path=Chapters/Started/glossary.pillar}$
${inputFile:path=Chapters/Tips/tips.pillar}$
"
Class {
	#name : #PRValidatorVisitor,
	#superclass : #PRVisitor,
	#instVars : [
		'anchors',
		'references'
	],
	#category : #'Pillar-BookTester'
}

{ #category : #initialization }
PRValidatorVisitor >> initialize [

	super initialize.
	anchors := OrderedCollection new. 
	references := OrderedCollection new. 
]

{ #category : #initialization }
PRValidatorVisitor >> isSuccess [
	
	| wrongReference |
	wrongReference := true.
	references do: [ :each | 
			(anchors includes: each)
				ifFalse: [ wrongReference := false ] ].
	^ wrongReference
]

{ #category : #'visiting-document' }
PRValidatorVisitor >> visitAnchor: anAnchor [
	
	anchors add: anAnchor name
	
]

{ #category : #'visiting-document' }
PRValidatorVisitor >> visitFigure: aFigure [
	
	super visitFigure: aFigure.
	anchors add: aFigure label.
	
]

{ #category : #'visiting-document' }
PRValidatorVisitor >> visitInternalLink: aLink [

	super visitInternalLink: aLink.
	references add: aLink anchor.
]
