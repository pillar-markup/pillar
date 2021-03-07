Class {
	#name : #PRDocumentTest3,
	#superclass : #PRDocumentGroupTest3,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRDocumentTest3 class >> isAbstract [
	^ false
]

{ #category : #private }
PRDocumentTest3 >> actualClass [
	^ PRDocument
]

{ #category : #'tests-parsing' }
PRDocumentTest3 >> testParseEmpty [
	| wiki text tree |
	wiki := String new.
	text := String new.
	tree := PRDocument new.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRDocumentTest3 >> testParseMultipleProperties [
	| wiki text tree document|
	wiki := '{''title'':''The title'',''authors'':''Someone else and me''}'.
	text := String new.
	tree := PRDocument new
		propertyAt: 'title' put: 'The title';
		propertyAt: 'authors' put: 'Someone else and me';
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text.
	document := self parser parse: wiki.
	self assert: document properties equals: tree properties
]

{ #category : #'tests-parsing' }
PRDocumentTest3 >> testParseProperties [
	| wiki text tree document |
	wiki := '{''title'':''The title''}'.
	text := String new.
	tree := PRDocument new
		propertyAt: 'title' put: 'The title';
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text.
	document := self parser parse: wiki.
	self assert: document properties equals: tree properties
]

{ #category : #'tests-parsing' }
PRDocumentTest3 >> testParsePropertiesWithText [
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
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text.
	document := self parser parse: wiki.
	self assert: document properties equals: tree properties
]
