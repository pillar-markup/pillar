Class {
	#name : #PRFormatTest,
	#superclass : #PRDocumentGroupTest,
	#instVars : [
		'otherClass',
		'markup'
	],
	#category : #'Pillar-Tests-Core'
}

{ #category : #private }
PRFormatTest >> actualClass [
	^ PRFormat
]

{ #category : #accessing }
PRFormatTest >> otherClass [
	^ otherClass ifNil: [ otherClass := PRFormat allSubclasses detect: [ :each | self actualClass ~= each ] ]
]

{ #category : #'as yet unclassified' }
PRFormatTest >> setUp [
	super setUp.
	markup := PRPillarGrammar markups at: self actualClass
]

{ #category : #'tests-parsing' }
PRFormatTest >> testParseBasic [
	| wiki text tree |
	wiki := '1' , markup , '2' , markup , '3'.
	text := '123'.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: '1');
				add: (self actualClass with: (PRText content: '2'));
				add: (PRText content: '3');
				yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRFormatTest >> testParseEnd [
	| wiki text tree |
	wiki := '1' , markup , '2' , markup.
	text := '12'.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: '1');
				add: (self actualClass with: (PRText content: '2'));
				yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRFormatTest >> testParseEscaped [
	| wiki text tree |
	wiki := ' ' , (PRPillarWriter escapeMarkup: markup) , (PRPillarWriter escapeMarkup: markup).
	text := ' ' , markup , markup.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: ' ' , markup , markup);
				yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRFormatTest >> testParseIncomplete [
	| wiki1 wiki2 text tree |
	wiki1 := '1' , markup , '2'.
	wiki2 := '1' , (PRPillarWriter escapeMarkup: markup) , '2'.
	text := '1' , markup , '2'.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: '1' , markup , '2');
				yourself);
		yourself.
	self assertWiki: wiki1 equalsTree: tree.
	self assertWiki: wiki2 equalsTree: tree.
	self assertTree: tree equalsWiki: wiki2.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRFormatTest >> testParseMany [
	| wiki text tree |
	wiki := '1' , markup , '2' , markup , '3' , markup , '4' , markup , '5'.
	text := '12345'.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: '1');
				add: (self actualClass with: (PRText content: '2'));
				add: (PRText content: '3');
				add: (self actualClass with: (PRText content: '4'));
				add: (PRText content: '5');
				yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRFormatTest >> testParseNested [
	| wiki text tree |
	wiki := '1' , markup , '2' , (PRPillarGrammar markups at: self otherClass) , '3'
		, (PRPillarGrammar markups at: self otherClass) , '4' , markup , '5'.
	text := '12345'.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: '1');
				add:
					(self actualClass new
						add: (PRText content: '2');
						add:
							(self otherClass new
								add: (PRText content: '3');
								yourself);
						add: (PRText content: '4');
						yourself);
				add: (PRText content: '5');
				yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRFormatTest >> testParseNestedTight [
	| wiki text tree |
	wiki := ' ' , markup , (PRPillarGrammar markups at: self otherClass)
		, (PRPillarGrammar markups at: self otherClass) , markup.
	text := ' '.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: ' ');
				add: (self actualClass new add: self otherClass new yourself);
				yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRFormatTest >> testParseWithNewLine [
	| wiki text tree |
	wiki := '1' , markup , '2', Smalltalk os lineEnding, '3' , markup , '4'.
	text := '12', Smalltalk os lineEnding, '34'.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: '1');
				add: (self actualClass with: (PRText content: '2', Smalltalk os lineEnding, '3'));
				add: (PRText content: '4');
				yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRFormatTest >> testParseWithSpace [
	| wiki text tree |
	wiki := '1' , markup , '2 3' , markup , '4'.
	text := '12 34'.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: '1');
				add: (self actualClass with: (PRText content: '2 3'));
				add: (PRText content: '4');
				yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]
