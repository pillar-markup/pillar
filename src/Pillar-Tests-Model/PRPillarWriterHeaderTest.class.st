Class {
	#name : #PRPillarWriterHeaderTest,
	#superclass : #PRPillarWriterDocumentGroupTest,
	#category : #'Pillar-Tests-Model-PillarWriter'
}

{ #category : #testing }
PRPillarWriterHeaderTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarWriterHeaderTest >> actualClass [
	^ PRHeader
]

{ #category : #'tests-parsing' }
PRPillarWriterHeaderTest >> testParseEmpty [
	| wiki tree |
	wiki := '!'.
	tree := PRDocument new
		add: (PRHeader new
			level: 1;
			yourself);
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterHeaderTest >> testParseLevel1 [
	| wiki tree |
	wiki := '!foo'.
	tree := PRDocument new
		add: ((PRHeader new)
			level: 1;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki.

]

{ #category : #'tests-parsing' }
PRPillarWriterHeaderTest >> testParseLevel2 [
	| wiki tree |
	wiki := '!!foo'.
	tree := PRDocument new
		add: ((PRHeader new)
			level: 2;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki.

]

{ #category : #'tests-parsing' }
PRPillarWriterHeaderTest >> testParseLevel3 [
	| wiki tree |
	wiki := '!!!foo'.
	tree := PRDocument new
		add: ((PRHeader new)
			level: 3;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki.

]

{ #category : #'tests-parsing' }
PRPillarWriterHeaderTest >> testParseLevel4 [
	| wiki tree |
	wiki := '!!!!foo'.
	tree := PRDocument new
		add: ((PRHeader new)
			level: 4;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki.

]

{ #category : #'tests-parsing' }
PRPillarWriterHeaderTest >> testParseLevel5 [
	| wiki tree |
	wiki := '!!!!!foo'.
	tree := PRDocument new
		add: ((PRHeader new)
			level: 5;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki.

]

{ #category : #'tests-parsing' }
PRPillarWriterHeaderTest >> testParseLevel6 [
	| wiki tree |
	wiki := '!!!!!!foo'.
	tree := PRDocument new
		add: ((PRHeader new)
			level: 6;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki.

]

{ #category : #'tests-parsing' }
PRPillarWriterHeaderTest >> testParseMultiline [
	| wiki tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '!!Hello ""This is' , nLine , 'bold"" end' , nLine , 'new'.
	tree := PRDocument new
		add:
				(PRHeader new
						level: 2;
						add: (PRText content: 'Hello ');
						add: (self addText: 'This is' , nLine , 'bold' to: PRBoldFormat new);
						add: (PRText content: ' end');
						yourself);
		add: (self addText: 'new' to: PRParagraph new);
		yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterHeaderTest >> testParseNested [
	| wiki text tree |
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
	self pillarWriterAssertTree: tree equalsWiki: wiki.

]

{ #category : #'tests-parsing' }
PRPillarWriterHeaderTest >> testParseWithTrailingSpaces [
	| wiki tree |
	wiki := '!  foo'.
	tree := PRDocument new
		add: ((PRHeader new)
			level: 1;
			add: (PRText content: 'foo');
			yourself);
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: '!foo'
]
