Class {
	#name : #PRParsePreformattedTest,
	#superclass : #PRParseDocumentGroupTest,
	#category : #'Pillar-Tests-Model-Parser'
}

{ #category : #testing }
PRParsePreformattedTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRParsePreformattedTest >> actualClass [
	^ PRPreformatted
]

{ #category : #'tests-parsing' }
PRParsePreformattedTest >> testParseBasic [
	| wiki tree |
	wiki := '= Line'.
	tree := PRDocument new
		add: (PRPreformatted new
			add: (PRText content: 'Line');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParsePreformattedTest >> testParseEmpty [
	| wiki  tree |
	wiki := '= '.

	tree := PRDocument new
		add: (PRPreformatted new
			add: (PRText content: '');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParsePreformattedTest >> testParseMultiple [

	| wiki tree nLine |
	nLine := self lineEnding.
	wiki := '= line 1.1' , nLine , '= line 1.2' , nLine , nLine
	        , '= line 2.1'.
	tree := PRDocument new
		        add: (PRPreformatted new
				         add: (PRText content: 'line 1.1');
				         add: (PRText content: 'line 1.2');
				         yourself);
		        add: PREmptyParagraph new;
		        add: (PRPreformatted new
				         add: (PRText content: 'line 2.1');
				         yourself);
		        yourself.
	self parserAssertWiki: wiki equalsTree: tree
]

{ #category : #'tests-parsing' }
PRParsePreformattedTest >> testParseSpaces [

	| wiki tree nLine |
	nLine := self lineEnding.
	wiki := '=    A line with 3 spaces' , nLine , '= 	A line with a tab'.
	tree := PRDocument new
		        add: (PRPreformatted new
				         add: (PRText content: '   A line with 3 spaces');
				         add: (PRText content: '	A line with a tab');
				         yourself);
		        yourself.
	self parserAssertWiki: wiki equalsTree: tree
]

{ #category : #'tests-parsing' }
PRParsePreformattedTest >> testParseSpecials [
	| wiki tree |
	wiki := '= |, {, }, *, *, [, ||, |{, |}, +, +'.
	tree := PRDocument new
		add: (PRPreformatted new
			add: (PRText content: '|, {, }, *, *, [, ||, |{, |}, +, +');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]
