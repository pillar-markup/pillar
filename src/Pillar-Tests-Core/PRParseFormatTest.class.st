Class {
	#name : #PRParseFormatTest,
	#superclass : #PRParseDocumentGroupTest,
	#instVars : [
		'otherClass',
		'markup'
	],
	#category : #'Pillar-Tests-Core'
}

{ #category : #private }
PRParseFormatTest >> actualClass [
	^ PRFormat
]

{ #category : #accessing }
PRParseFormatTest >> otherClass [
	^ otherClass ifNil: [ otherClass := PRFormat allSubclasses detect: [ :each | self actualClass ~= each ] ]
]

{ #category : #running }
PRParseFormatTest >> setUp [

	super setUp.
	markup := PRPillarGrammar markups at: self actualClass
]

{ #category : #'tests-parsing' }
PRParseFormatTest >> testParseBasic [
	| wiki tree |
	wiki := '1' , markup , '2' , markup , '3'.

	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: '1');
				add: (self actualClass with: (PRText content: '2'));
				add: (PRText content: '3');
				yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseFormatTest >> testParseEnd [
	| wiki tree |
	wiki := '1' , markup , '2' , markup.
	
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: '1');
				add: (self actualClass with: (PRText content: '2'));
				yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseFormatTest >> testParseEscaped [
	| wiki tree |
	wiki := ' ' , (PRPillarWriter escapeMarkup: markup) , (PRPillarWriter escapeMarkup: markup).
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: ' ' , markup , markup);
				yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseFormatTest >> testParseIncomplete [
	| wiki1 wiki2 tree |
	wiki1 := '1' , markup , '2'.
	wiki2 := '1' , (PRPillarWriter escapeMarkup: markup) , '2'.
	
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: '1' , markup , '2');
				yourself);
		yourself.
	self parserAssertWiki: wiki1 equalsTree: tree.
	self parserAssertWiki: wiki2 equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseFormatTest >> testParseMany [
	| wiki tree |
	wiki := '1' , markup , '2' , markup , '3' , markup , '4' , markup , '5'.
	
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
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseFormatTest >> testParseNested [
	| wiki tree |
	wiki := '1' , markup , '2' , (PRPillarGrammar markups at: self otherClass) , '3'
		, (PRPillarGrammar markups at: self otherClass) , '4' , markup , '5'.
	
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
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseFormatTest >> testParseNestedTight [
	| wiki tree |
	wiki := ' ' , markup , (PRPillarGrammar markups at: self otherClass)
		, (PRPillarGrammar markups at: self otherClass) , markup.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: ' ');
				add: (self actualClass new add: self otherClass new yourself);
				yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseFormatTest >> testParseWithNewLine [
	| wiki tree |
	wiki := '1' , markup , '2', Smalltalk os lineEnding, '3' , markup , '4'.
	
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: '1');
				add: (self actualClass with: (PRText content: '2', Smalltalk os lineEnding, '3'));
				add: (PRText content: '4');
				yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseFormatTest >> testParseWithSpace [
	| wiki tree |
	wiki := '1' , markup , '2 3' , markup , '4'.

	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: '1');
				add: (self actualClass with: (PRText content: '2 3'));
				add: (PRText content: '4');
				yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]
