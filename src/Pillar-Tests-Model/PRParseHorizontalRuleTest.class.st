Class {
	#name : #PRParseHorizontalRuleTest,
	#superclass : #PRParseDocumentItemTest,
	#category : #'Pillar-Tests-Model-Parser'
}

{ #category : #testing }
PRParseHorizontalRuleTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRParseHorizontalRuleTest >> actualClass [
	^ PRHorizontalRule
]

{ #category : #'tests-parsing' }
PRParseHorizontalRuleTest >> testParseBasic [
	| wiki tree |
	wiki := '_'.
	tree := PRDocument new
		add: PRHorizontalRule new;
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseHorizontalRuleTest >> testParseLink [
	| wiki1 wiki2 tree |
	wiki1 := '_ *link*'.
	wiki2 := '\_ *link*'.
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
	
]

{ #category : #'tests-parsing' }
PRParseHorizontalRuleTest >> testParseMultiple [

	| wiki tree nLine |
	nLine := self lineEnding.
	wiki := '_' , nLine , '_' , nLine , nLine , '_'.
	tree := PRDocument new
		        add: PRHorizontalRule new;
		        add: PRHorizontalRule new;
		        add: PREmptyParagraph new;
		        add: PRHorizontalRule new;
		        yourself.
	self parserAssertWiki: wiki equalsTree: tree
]

{ #category : #'tests-parsing' }
PRParseHorizontalRuleTest >> testParseParagraph [
	| wiki tree |
	wiki := '\_ is parsed as paragraph'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: '_ is parsed as paragraph');
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseHorizontalRuleTest >> testParseSpaces [
	| wiki text tree |
	wiki := '_       '.
	tree := PRDocument new
		add: PRHorizontalRule new;
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #private }
PRParseHorizontalRuleTest >> textString [
	^ String new: 40 withAll: $-
]
