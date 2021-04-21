Class {
	#name : #PRParseRawTest,
	#superclass : #PRParseTextTest,
	#category : #'Pillar-Tests-Model-PetitPillar'
}

{ #category : #private }
PRParseRawTest >> actualClass [
	^ PRRaw
]

{ #category : #'tests-parsing' }
PRParseRawTest >> testParseBasic [
	| wiki tree |
	wiki := '{{{abc}}}'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'abc');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseRawTest >> testParseEmpty [
	| wiki tree |
	wiki := '{{{}}}'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: '');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseRawTest >> testParseMultiline [

	| wiki tree nLine |
	nLine := self lineEnding.
	wiki := '{{{a' , nLine , 'b}}}'.
	tree := PRDocument new
		        add: (PRParagraph new
				         add: (PRRaw content: 'a' , nLine , 'b');
				         yourself);
		        yourself.
	self parserAssertWiki: wiki equalsTree: tree
]

{ #category : #'tests-parsing' }
PRParseRawTest >> testParseMultiple [
	| wiki tree |
	wiki := '{{{a}}}b{{{c}}}'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'a');
			add: (PRText content: 'b');
			add: (PRRaw content: 'c');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseRawTest >> testParseMultipleMultiline [

	| wiki tree nLine |
	nLine := self lineEnding.
	wiki := '{{{a' , nLine , 'b}}}c{{{d' , nLine , 'e}}}'.
	tree := PRDocument new
		        add: (PRParagraph new
				         add: (PRRaw content: 'a' , nLine , 'b');
				         add: (PRText content: 'c');
				         add: (PRRaw content: 'd' , nLine , 'e');
				         yourself);
		        yourself.
	self parserAssertWiki: wiki equalsTree: tree
]

{ #category : #'tests-parsing' }
PRParseRawTest >> testParseStrange [
	| wiki tree |
	wiki := '{{{a{{||}}b}}}'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'a{{||}}b');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseRawTest >> testParseTypeHtml [
	| wiki tree |
	wiki := '{{{html:abc}}}'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'abc' type: 'html');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseRawTest >> testParseTypeLatex [
	| wiki tree |
	wiki := '{{{latex:abc}}}'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'abc' type: 'latex');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseRawTest >> testParseTypeText [
	| wiki tree |
	wiki := '{{{text:abc}}}'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'abc' type: 'text');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
]
