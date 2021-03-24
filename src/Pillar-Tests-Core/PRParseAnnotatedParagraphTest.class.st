Class {
	#name : #PRParseAnnotatedParagraphTest,
	#superclass : #PRParseDocumentGroupTest,
	#category : #'Pillar-Tests-Core-Parse'
}

{ #category : #testing }
PRParseAnnotatedParagraphTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRParseAnnotatedParagraphTest >> actualClass [
	^ PRAnnotatedParagraph
]

{ #category : #'tests-parsing' }
PRParseAnnotatedParagraphTest >> testParseBasic [
	| wiki tree |
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
PRParseAnnotatedParagraphTest >> testParseEmptyFollowedByPreformatted [

	| wiki tree nLine |
	nLine := self lineEnding.
	wiki := '@@foo' , nLine , '= bar'.
	tree := PRDocument new
		        add: (PRAnnotatedParagraph new
				         annotation: 'foo';
				         yourself);
		        add: (PRPreformatted new
				         add: (PRText content: 'bar');
				         yourself);
		        yourself.
	self parserAssertWiki: wiki equalsTree: tree
]

{ #category : #'tests-parsing' }
PRParseAnnotatedParagraphTest >> testParseOnlyAnnotation [
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
PRParseAnnotatedParagraphTest >> testParseOnlyNothing [
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
PRParseAnnotatedParagraphTest >> testParseOnlyText [
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
