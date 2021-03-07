Class {
	#name : #PRAnnotatedParagraphTest2,
	#superclass : #PRDocumentGroupTest,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRAnnotatedParagraphTest2 class >> isAbstract [
	^ false
]

{ #category : #private }
PRAnnotatedParagraphTest2 >> actualClass [
	^ PRAnnotatedParagraph
]

{ #category : #'tests-parsing' }
PRAnnotatedParagraphTest2 >> testParseBasic [
	| wiki text tree |
	wiki := '@@foo bar zork'.
	text := 'bar zork'.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			annotation: 'foo';
			add: (PRText content: 'bar zork');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRAnnotatedParagraphTest2 >> testParseEmptyFollwedByPreformatted [
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
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRAnnotatedParagraphTest2 >> testParseOnlyAnnotation [
	| wiki text tree |
	wiki := '@@foo'.
	text := ''.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			annotation: 'foo';
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRAnnotatedParagraphTest2 >> testParseOnlyNothing [
	| wiki text tree |
	wiki := '@@'.
	text := ''.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			annotation: '';
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRAnnotatedParagraphTest2 >> testParseOnlyText [
	| wiki text tree |
	wiki := '@@ foo bar'.
	text := 'foo bar'.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			add: (PRText content: 'foo bar');
			annotation: '';
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]
