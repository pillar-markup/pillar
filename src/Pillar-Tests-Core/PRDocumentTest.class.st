Class {
	#name : #PRDocumentTest,
	#superclass : #PRDocumentGroupTest,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRDocumentTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRDocumentTest >> actualClass [
	^ PRDocument
]

{ #category : #'tests-parsing' }
PRDocumentTest >> testParseEmpty [
	| wiki text tree |
	wiki := String new.
	text := String new.
	tree := PRDocument new.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRDocumentTest >> testParseMultipleProperties [
	| wiki text tree document|
	wiki := '{''title'':''The title'',''authors'':''Someone else and me''}'.
	text := String new.
	tree := PRDocument new
		propertyAt: 'title' put: 'The title';
		propertyAt: 'authors' put: 'Someone else and me';
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text.
	document := self parser parse: wiki.
	self assert: document properties equals: tree properties
]

{ #category : #'tests-parsing' }
PRDocumentTest >> testParseProperties [
	| wiki text tree document |
	wiki := '{''title'':''The title''}'.
	text := String new.
	tree := PRDocument new
		propertyAt: 'title' put: 'The title';
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text.
	document := self parser parse: wiki.
	self assert: document properties equals: tree properties
]

{ #category : #'tests-parsing' }
PRDocumentTest >> testParsePropertiesWithText [
	| wiki text tree document |
	wiki := '{''title'':''The title''}' , Smalltalk os lineEnding , 'foobar'.
	text := 'foobar'.
	tree := PRDocument new
		propertyAt: 'title' put: 'The title';
		add:
				(PRParagraph new
						add: (PRText content: 'foobar');
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text.
	document := self parser parse: wiki.
	self assert: document properties equals: tree properties
]
