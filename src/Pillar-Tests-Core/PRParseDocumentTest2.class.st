Class {
	#name : #PRParseDocumentTest2,
	#superclass : #PRParseDocumentGroupTest2,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRParseDocumentTest2 class >> isAbstract [
	^ false
]

{ #category : #private }
PRParseDocumentTest2 >> actualClass [
	^ PRDocument
]

{ #category : #'tests-parsing' }
PRParseDocumentTest2 >> testParseEmpty [
	| wiki tree |
	wiki := String new.
	tree := PRDocument new.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseDocumentTest2 >> testParseMultipleProperties [
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
PRParseDocumentTest2 >> testParseProperties [
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
PRParseDocumentTest2 >> testParsePropertiesWithText [
	| wiki tree document |
	wiki := '{''title'':''The title''}' , Smalltalk os lineEnding , 'foobar'.
	tree := PRDocument new
		propertyAt: 'title' put: 'The title';
		add:
				(PRParagraph new
						add: (PRText content: 'foobar');
						yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	document := self parser parse: wiki.
	self assert: document properties equals: tree properties
]
