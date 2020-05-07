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
		'references',
		'allTestsResults',
		'finalStatus'
	],
	#category : #'Pillar-BookTester-Visitor'
}

{ #category : #accessing }
PRValidatorVisitor >> allTestsResults [
	^ allTestsResults 
]

{ #category : #accessing }
PRValidatorVisitor >> anchors [
	^ anchors
]

{ #category : #checking }
PRValidatorVisitor >> checkAllReferencesReferToAnExistingAnchor [
	references do: [ :each | 
			(anchors includes: each)
				ifFalse: [ allTestsResults add: (self result anchorIsMissing: each) ] ]
	
]

{ #category : #checking }
PRValidatorVisitor >> finalCheck [
	
	self checkAllReferencesReferToAnExistingAnchor.
]

{ #category : #accessing }
PRValidatorVisitor >> finalStatus [
	^ allTestsResults isEmpty
]

{ #category : #initialization }
PRValidatorVisitor >> initialize [

	super initialize.
	
	allTestsResults := OrderedCollection new.
	finalStatus := true.
	
	anchors := OrderedCollection new.
	references := OrderedCollection new. 
]

{ #category : #testing }
PRValidatorVisitor >> isFailure [
	^ self finalStatus not
]

{ #category : #testing }
PRValidatorVisitor >> isSuccess [
	^ self finalStatus
]

{ #category : #accessing }
PRValidatorVisitor >> references [
	^ references
]

{ #category : #accessing }
PRValidatorVisitor >> result [
	^ PRValidatorResult
]

{ #category : #visiting }
PRValidatorVisitor >> start: anObject [
	super start: anObject.
	self finalCheck.
]

{ #category : #'visiting-document' }
PRValidatorVisitor >> visitAnchor: anAnchor [
	super visitAnchor: anAnchor.
	(anchors includes: anAnchor name) ifTrue: [ allTestsResults add: (self result twoAnchorsSameNameWith: anAnchor name ) ] ifFalse: [ anchors add: anAnchor name ].
	
	
]

{ #category : #'visiting-document' }
PRValidatorVisitor >> visitFigure: aFigure [
	super visitFigure: aFigure.
	self halt.
	(anchors includes: aFigure label) ifTrue: [ allTestsResults add: (self result twoAnchorsRelativeToFigureSameNameWith: aFigure label ) ] ifFalse: [ anchors add: aFigure label ].
	
]

{ #category : #'visiting-document' }
PRValidatorVisitor >> visitInternalLink: aLink [
	super visitInternalLink: aLink.
	references add: aLink anchor.
]
