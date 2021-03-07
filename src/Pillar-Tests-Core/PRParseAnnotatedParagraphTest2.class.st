Class {
	#name : #PRParseAnnotatedParagraphTest2,
	#superclass : #PRParseDocumentGroupTest,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRParseAnnotatedParagraphTest2 class >> isAbstract [
	^ false
]

{ #category : #private }
PRParseAnnotatedParagraphTest2 >> actualClass [
	^ PRAnnotatedParagraph
]

{ #category : #'tests-parsing' }
PRParseAnnotatedParagraphTest2 >> testParseBasic [
	| wiki  tree |
	wiki := '@@foo bar zork'.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			annotation: 'foo';
			add: (PRText content: 'bar zork');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseAnnotatedParagraphTest2 >> testParseEmptyFollowedByPreformatted [
	| wiki tree nLine|
	nLine := Smalltalk os lineEnding.
	wiki := '@@foo' , nLine , '= bar'.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			annotation: 'foo';
			yourself);
		add: (PRPreformatted new
			add: (PRText content: 'bar');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseAnnotatedParagraphTest2 >> testParseOnlyAnnotation [
	| wiki tree |
	wiki := '@@foo'.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			annotation: 'foo';
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseAnnotatedParagraphTest2 >> testParseOnlyNothing [
	| wiki tree |
	wiki := '@@'.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			annotation: '';
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseAnnotatedParagraphTest2 >> testParseOnlyText [
	| wiki tree |
	wiki := '@@ foo bar'.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			add: (PRText content: 'foo bar');
			annotation: '';
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]
