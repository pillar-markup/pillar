Class {
	#name : #PRParseDocumentTest,
	#superclass : #PRParseDocumentGroupTest,
	#category : #'Pillar-Tests-Core-Parse'
}

{ #category : #testing }
PRParseDocumentTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRParseDocumentTest >> actualClass [
	^ PRDocument
]

{ #category : #'tests-parsing' }
PRParseDocumentTest >> lineEnding [

	^ Smalltalk os lineEnding
]

{ #category : #'tests-parsing' }
PRParseDocumentTest >> testParseEmpty [
	| wiki tree |
	wiki := String new.
	tree := PRDocument new.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseDocumentTest >> testParseMultipleProperties [
	| wiki tree document|
	wiki := '{''title'':''The title'',''authors'':''Someone else and me''}'.
	tree := PRDocument new
		propertyAt: 'title' put: 'The title';
		propertyAt: 'authors' put: 'Someone else and me';
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	document := self parser parse: wiki.
	self assert: document properties equals: tree properties
]

{ #category : #'tests-parsing' }
PRParseDocumentTest >> testParseProperties [
	| wiki  tree document |
	wiki := '{''title'':''The title''}'.
	tree := PRDocument new
		propertyAt: 'title' put: 'The title';
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	document := self parser parse: wiki.
	self assert: document properties equals: tree properties
]

{ #category : #'tests-parsing' }
PRParseDocumentTest >> testParsePropertiesWithText [

	| wiki tree document |
	wiki := '{''title'':''The title''}' , self lineEnding , 'foobar'.
	tree := PRDocument new
		        propertyAt: 'title' put: 'The title';
		        add: (PRParagraph new
				         add: (PRText content: 'foobar');
				         yourself);
		        yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	document := self parser parse: wiki.
	self assert: document properties equals: tree properties
]
