Class {
	#name : #PRPillarWriterRawTest,
	#superclass : #PRPillarWriterTextTest,
	#category : #'Pillar-Tests-Model-ExporterPillar'
}

{ #category : #private }
PRPillarWriterRawTest >> actualClass [
	^ PRRaw
]

{ #category : #'tests-parsing' }
PRPillarWriterRawTest >> testParseBasic [
	| wiki text tree |
	wiki := '{{{abc}}}'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'abc');
			yourself);
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterRawTest >> testParseEmpty [
	| wiki tree |
	wiki := '{{{}}}'.

	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: '');
			yourself);
		yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterRawTest >> testParseMultiline [

	| wiki tree nLine |
	nLine := self lineEnding.
	wiki := '{{{a' , nLine , 'b}}}'.
	tree := PRDocument new
		        add: (PRParagraph new
				         add: (PRRaw content: 'a' , nLine , 'b');
				         yourself);
		        yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarWriterRawTest >> testParseMultiple [
	| wiki tree |
	wiki := '{{{a}}}b{{{c}}}'.

	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'a');
			add: (PRText content: 'b');
			add: (PRRaw content: 'c');
			yourself);
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki.

]

{ #category : #'tests-parsing' }
PRPillarWriterRawTest >> testParseMultipleMultiline [

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

	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarWriterRawTest >> testParseStrange [
	| wiki tree |
	wiki := '{{{a{{||}}b}}}'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'a{{||}}b');
			yourself);
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki.

]

{ #category : #'tests-parsing' }
PRPillarWriterRawTest >> testParseTypeHtml [
	| wiki tree |
	wiki := '{{{html:abc}}}'.

	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'abc' type: 'html');
			yourself);
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterRawTest >> testParseTypeLatex [
	| wiki text tree |
	wiki := '{{{latex:abc}}}'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'abc' type: 'latex');
			yourself);
		yourself.
	
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterRawTest >> testParseTypeText [
	| wiki tree |
	wiki := '{{{text:abc}}}'.

	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'abc' type: 'text');
			yourself);
		yourself.
	
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]
