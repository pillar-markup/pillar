Class {
	#name : #PRPillarWriterHorizontalRuleTest,
	#superclass : #PRPillarWriterDocumentItemTest,
	#category : #'Pillar-Tests-Model-ExporterPillar'
}

{ #category : #testing }
PRPillarWriterHorizontalRuleTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarWriterHorizontalRuleTest >> actualClass [
	^ PRHorizontalRule
]

{ #category : #'tests-parsing' }
PRPillarWriterHorizontalRuleTest >> testParseBasic [
	| wiki tree |
	wiki := '_'.
	tree := PRDocument new
		add: PRHorizontalRule new;
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterHorizontalRuleTest >> testParseLink [
	| wiki2 tree |
	wiki2 := '\_ *link*'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: '_ ');
			add: (PRInternalLink new
				reference: 'link';
				yourself);
			yourself);
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki2.

]

{ #category : #'tests-parsing' }
PRPillarWriterHorizontalRuleTest >> testParseMultiple [

	| wiki tree nLine |
	nLine := self lineEnding.
	wiki := '_' , nLine , '_' , nLine , nLine , '_'.

	tree := PRDocument new
		        add: PRHorizontalRule new;
		        add: PRHorizontalRule new;
		        add: PREmptyParagraph new;
		        add: PRHorizontalRule new;
		        yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarWriterHorizontalRuleTest >> testParseParagraph [
	| wiki text tree |
	wiki := '\_ is parsed as paragraph'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: '_ is parsed as paragraph');
			yourself);
		yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterHorizontalRuleTest >> testParseSpaces [
	| wiki tree |
	wiki := '_       '.
	tree := PRDocument new
		add: PRHorizontalRule new;
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: '_'.
	
]

{ #category : #private }
PRPillarWriterHorizontalRuleTest >> textString [
	^ String new: 40 withAll: $-
]
