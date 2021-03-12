Class {
	#name : #PRRawTest3,
	#superclass : #PRTextWriterTextTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #private }
PRRawTest3 >> actualClass [
	^ PRRaw
]

{ #category : #'tests-parsing' }
PRRawTest3 >> testParseBasic [
	| wiki text tree |
	wiki := '{{{abc}}}'.
	text := 'abc'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'abc');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRRawTest3 >> testParseEmpty [
	| wiki text tree |
	wiki := '{{{}}}'.
	text := ''.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: '');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRRawTest3 >> testParseMultiline [
	| wiki text tree nLine|
	nLine := Smalltalk os lineEnding.
	wiki := '{{{a' , nLine , 'b}}}'.
	text := 'a' , nLine , 'b'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'a' , nLine , 'b');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRRawTest3 >> testParseMultiple [
	| wiki text tree |
	wiki := '{{{a}}}b{{{c}}}'.
	text := 'abc'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'a');
			add: (PRText content: 'b');
			add: (PRRaw content: 'c');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRRawTest3 >> testParseMultipleMultiline [
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '{{{a' , nLine , 'b}}}c{{{d' , nLine , 'e}}}'.
	text := 'a' , nLine , 'bcd' , nLine , 'e'.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRRaw content: 'a' , nLine , 'b');
						add: (PRText content: 'c');
						add: (PRRaw content: 'd' , nLine , 'e');
						yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRRawTest3 >> testParseStrange [
	| wiki text tree |
	wiki := '{{{a{{||}}b}}}'.
	text := 'a{{||}}b'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'a{{||}}b');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRRawTest3 >> testParseTypeHtml [
	| wiki text tree |
	wiki := '{{{html:abc}}}'.
	text := ''.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'abc' type: 'html');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRRawTest3 >> testParseTypeLatex [
	| wiki text tree |
	wiki := '{{{latex:abc}}}'.
	text := ''.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'abc' type: 'latex');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRRawTest3 >> testParseTypeText [
	| wiki text tree |
	wiki := '{{{text:abc}}}'.
	text := 'abc'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'abc' type: 'text');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-accessing' }
PRRawTest3 >> testType [
	self instance type: 'html'.
	self assert: self instance type equals: 'html'
]
