Class {
	#name : #PRPillarWriterAnnotatedParagraphTest,
	#superclass : #PRPillarWriterDocumentGroupTest4,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRPillarWriterAnnotatedParagraphTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarWriterAnnotatedParagraphTest >> actualClass [
	^ PRAnnotatedParagraph
]

{ #category : #'tests-parsing' }
PRPillarWriterAnnotatedParagraphTest >> testParseBasic [
	| wiki tree |
	wiki := '@@foo bar zork'.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			annotation: 'foo';
			add: (PRText content: 'bar zork');
			yourself);
		yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterAnnotatedParagraphTest >> testParseEmptyFollwedByPreformatted [
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

	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterAnnotatedParagraphTest >> testParseOnlyAnnotation [
	| wiki text tree |
	wiki := '@@foo'.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			annotation: 'foo';
			yourself);
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki.

]

{ #category : #'tests-parsing' }
PRPillarWriterAnnotatedParagraphTest >> testParseOnlyNothing [
	| wiki tree |
	wiki := '@@'.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			annotation: '';
			yourself);
		yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterAnnotatedParagraphTest >> testParseOnlyText [
	| wiki  tree |
	wiki := '@@ foo bar'.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			add: (PRText content: 'foo bar');
			annotation: '';
			yourself);
		yourself.
	
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]
