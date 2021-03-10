Class {
	#name : #PRRawTest2,
	#superclass : #PRTextTest2,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #private }
PRRawTest2 >> actualClass [
	^ PRRaw
]

{ #category : #'tests-parsing' }
PRRawTest2 >> testParseBasic [
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
PRRawTest2 >> testParseEmpty [
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
PRRawTest2 >> testParseMultiline [
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
PRRawTest2 >> testParseMultiple [
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
PRRawTest2 >> testParseMultipleMultiline [
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
PRRawTest2 >> testParseStrange [
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
PRRawTest2 >> testParseTypeHtml [
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
PRRawTest2 >> testParseTypeLatex [
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
PRRawTest2 >> testParseTypeText [
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
PRRawTest2 >> testType [
	self instance type: 'html'.
	self assert: self instance type equals: 'html'
]
