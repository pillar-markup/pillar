Class {
	#name : #PRCodeSemanticActionTest,
	#superclass : #TestCase,
	#instVars : [
		'sample'
	],
	#category : #'Pillar-ExporterRichText-Tests'
}

{ #category : #tests }
PRCodeSemanticActionTest >> testReferenceToAClass [

	| text |
	text := (PRMonospaceFormat with: (PRText content: 'Point')) children first text.
	self assert: (PRSemanticAction from: text) entity equals: Point
]

{ #category : #tests }
PRCodeSemanticActionTest >> testReferenceToAMetaClass [

	| text |
	text := (PRMonospaceFormat with: (PRText content: 'Point class')) children first text.
	self assert: (PRSemanticAction from: text) entity equals: Point class
]

{ #category : #'tests - methods' }
PRCodeSemanticActionTest >> testReferenceToAMethod [

	| text |
	text := (PRMonospaceFormat with: (PRText content: 'Point >> #setX:setY:')) children first text.
	self assert: (PRSemanticAction from: text) entity name equals: 'Point>>#setX:setY:'
]

{ #category : #'tests - methods' }
PRCodeSemanticActionTest >> testReferenceToANonExistingMethod [

	| text |
	text := (PRMonospaceFormat with: (PRText content: 'Point >> 12+3 ')) children first text.
	self assert: (PRSemanticAction from: text) entity isNil
]

{ #category : #'tests - methods' }
PRCodeSemanticActionTest >> testReferenceToANonExistingMethodBecauseOfBogusClass [

	| text |
	text := (PRMonospaceFormat with: (PRText content: 'Point222 >> #setX:setY:')) children first text.
	self assert: (PRSemanticAction from: text) entity isNil
]

{ #category : #'tests - methods' }
PRCodeSemanticActionTest >> testReferenceToANonExistingMethodBecauseOfNoSymbol [

	| text |
	text := (PRMonospaceFormat with: (PRText content: 'Point >> setX:setY:')) children first text.
	self assert: (PRSemanticAction from: text) entity isNil
]

{ #category : #tests }
PRCodeSemanticActionTest >> testReferenceToANonExistingPackage [

	| text |
	text := (PRMonospaceFormat with: (PRText content: #'Pillar')) children first text.
	self assert: (PRSemanticAction from: text) entity isNil
]

{ #category : #tests }
PRCodeSemanticActionTest >> testReferenceToAPackage [

	| text |
	text := (PRMonospaceFormat with: (PRText content: 'Pillar-ExporterRichText')) children first text.
	self assert: (PRSemanticAction from: text) entity name equals: 'Pillar-ExporterRichText'
]

{ #category : #tests }
PRCodeSemanticActionTest >> testReferenceToNonExistingClass [

	| text |
	text := (PRMonospaceFormat with: (PRText content: 'Point22')) children first text.
	self deny: (PRSemanticAction from: text) hasEntity
]
