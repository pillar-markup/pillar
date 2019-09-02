Class {
	#name : #PRAnnotatedParagraphTest,
	#superclass : #PRDocumentGroupTest,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRAnnotatedParagraphTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRAnnotatedParagraphTest >> actualClass [
	^ PRAnnotatedParagraph
]

{ #category : #'tests-parsing' }
PRAnnotatedParagraphTest >> testParseBasic [
	| wiki text tree |
	wiki := '@@foo bar zork'.
	text := 'bar zork'.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			annotation: 'foo';
			add: (PRText content: 'bar zork');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRAnnotatedParagraphTest >> testParseEmptyFollwedByPreformatted [
	| wiki text tree nLine|
	nLine := Smalltalk os lineEnding.
	wiki := '@@foo' , nLine , '= bar'.
	text := nLine , 'bar'.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			annotation: 'foo';
			yourself);
		add: (PRPreformatted new
			add: (PRText content: 'bar');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRAnnotatedParagraphTest >> testParseOnlyAnnotation [
	| wiki text tree |
	wiki := '@@foo'.
	text := ''.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			annotation: 'foo';
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRAnnotatedParagraphTest >> testParseOnlyNothing [
	| wiki text tree |
	wiki := '@@'.
	text := ''.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			annotation: '';
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRAnnotatedParagraphTest >> testParseOnlyText [
	| wiki text tree |
	wiki := '@@ foo bar'.
	text := 'foo bar'.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			add: (PRText content: 'foo bar');
			annotation: '';
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]
