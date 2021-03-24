Class {
	#name : #PRParseHeaderTest,
	#superclass : #PRParseDocumentGroupTest,
	#category : #'Pillar-Tests-Model-Parser'
}

{ #category : #testing }
PRParseHeaderTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRParseHeaderTest >> actualClass [
	^ PRHeader
]

{ #category : #'tests-parsing' }
PRParseHeaderTest >> testParseEmpty [
	| wiki tree |
	wiki := '!'.
	tree := PRDocument new
		add: (PRHeader new
			level: 1;
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseHeaderTest >> testParseLevel1 [
	| wiki tree |
	wiki := '!foo'.
	tree := PRDocument new
		add: (PRHeader new
			level: 1;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseHeaderTest >> testParseLevel2 [
	| wiki tree |
	wiki := '!!foo'.
	tree := PRDocument new
		add: (PRHeader new
			level: 2;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseHeaderTest >> testParseLevel3 [
	| wiki tree |
	wiki := '!!!foo'.
	tree := PRDocument new
		add: (PRHeader new
			level: 3;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseHeaderTest >> testParseLevel4 [
	| wiki tree |
	wiki := '!!!!foo'.
	tree := PRDocument new
		add: (PRHeader new
			level: 4;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseHeaderTest >> testParseLevel5 [
	| wiki tree |
	wiki := '!!!!!foo'.
	tree := PRDocument new
		add: (PRHeader new
			level: 5;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseHeaderTest >> testParseLevel6 [
	| wiki tree |
	wiki := '!!!!!!foo'.
	tree := PRDocument new
		add: (PRHeader new
			level: 6;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseHeaderTest >> testParseMultiline [

	| wiki tree nLine |
	nLine := self lineEnding.
	wiki := '!!Hello ""This is' , nLine , 'bold"" end' , nLine , 'new'.
	tree := PRDocument new
		        add: (PRHeader new
				         level: 2;
				         add: (PRText content: 'Hello ');
				         add:
					         (self
						          addText: 'This is' , nLine , 'bold'
						          to: PRBoldFormat new);
				         add: (PRText content: ' end');
				         yourself);
		        add: (self addText: 'new' to: PRParagraph new);
		        yourself.
	self parserAssertWiki: wiki equalsTree: tree
]

{ #category : #'tests-parsing' }
PRParseHeaderTest >> testParseNested [
	| wiki tree |
	wiki := '!!Hello *Link*'.
	tree := PRDocument new
		add: (PRHeader new
			level: 2;
			add: (PRText content: 'Hello ');
			add: (PRInternalLink new
				reference: 'Link';
				yourself);
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseHeaderTest >> testParseWithTrailingSpaces [
	| wiki text tree |
	wiki := '!  foo'.
	tree := PRDocument new
		add: (PRHeader new
			level: 1;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]
