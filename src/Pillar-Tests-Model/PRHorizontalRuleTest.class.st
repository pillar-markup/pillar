Class {
	#name : #PRHorizontalRuleTest,
	#superclass : #PRDocumentItemTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRHorizontalRuleTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRHorizontalRuleTest >> actualClass [
	^ PRHorizontalRule
]

{ #category : #'tests-parsing' }
PRHorizontalRuleTest >> testParseBasic [
	| wiki text tree |
	wiki := '_'.
	text := self textString.
	tree := PRDocument new
		add: PRHorizontalRule new;
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRHorizontalRuleTest >> testParseLink [
	| wiki1 wiki2 text tree |
	wiki1 := '_ *link*'.
	wiki2 := '\_ *link*'.
	text := '_ link'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: '_ ');
			add: (PRInternalLink new
				reference: 'link';
				yourself);
			yourself);
		yourself.
	self parserAssertWiki: wiki1 equalsTree: tree.
	self parserAssertWiki: wiki2 equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki2.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRHorizontalRuleTest >> testParseMultiple [
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '_' , nLine , '_' , nLine , nLine , '_'.
	text := self textString , nLine , self textString , nLine , nLine , self textString.
	tree := PRDocument new
		add: PRHorizontalRule new;
		add: PRHorizontalRule new;
		add: PREmptyParagraph new;
		add: PRHorizontalRule new;
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRHorizontalRuleTest >> testParseParagraph [
	| wiki text tree |
	wiki := '\_ is parsed as paragraph'.
	text := '_ is parsed as paragraph'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: '_ is parsed as paragraph');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRHorizontalRuleTest >> testParseSpaces [
	| wiki text tree |
	wiki := '_       '.
	text := self textString.
	tree := PRDocument new
		add: PRHorizontalRule new;
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: '_'.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #private }
PRHorizontalRuleTest >> textString [
	^ String new: 40 withAll: $-
]
