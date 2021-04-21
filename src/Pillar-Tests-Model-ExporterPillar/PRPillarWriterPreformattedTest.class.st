Class {
	#name : #PRPillarWriterPreformattedTest,
	#superclass : #PRPillarWriterDocumentGroupTest,
	#category : #'Pillar-Tests-Model-ExporterPillar'
}

{ #category : #testing }
PRPillarWriterPreformattedTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarWriterPreformattedTest >> actualClass [
	^ PRPreformatted
]

{ #category : #'tests-parsing' }
PRPillarWriterPreformattedTest >> testParseBasic [
	| wiki tree |
	wiki := '= Line'.
	tree := PRDocument new
		add: (PRPreformatted new
			add: (PRText content: 'Line');
			yourself);
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki.

]

{ #category : #'tests-parsing' }
PRPillarWriterPreformattedTest >> testParseEmpty [
	| wiki text tree |
	wiki := '= '.
	tree := PRDocument new
		add: (PRPreformatted new
			add: (PRText content: '');
			yourself);
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki.

]

{ #category : #'tests-parsing' }
PRPillarWriterPreformattedTest >> testParseMultiple [

	| wiki tree nLine |
	nLine := self lineEnding.
	wiki := '= line 1.1' , nLine , '= line 1.2' , nLine , nLine
	        , '= line 2.1'.
	tree := PRDocument new
		        add: (PRPreformatted new
				         add: (PRText content: 'line 1.1');
				         add: (PRText content: 'line 1.2');
				         yourself);
		        add: PREmptyParagraph new;
		        add: (PRPreformatted new
				         add: (PRText content: 'line 2.1');
				         yourself);
		        yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarWriterPreformattedTest >> testParseSpaces [

	| wiki tree nLine |
	nLine := self lineEnding.
	wiki := '=    A line with 3 spaces' , nLine , '= 	A line with a tab'.

	tree := PRDocument new
		        add: (PRPreformatted new
				         add: (PRText content: '   A line with 3 spaces');
				         add: (PRText content: '	A line with a tab');
				         yourself);
		        yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarWriterPreformattedTest >> testParseSpecials [
	| wiki tree |
	wiki := '= |, {, }, *, *, [, ||, |{, |}, +, +'.
	
	tree := PRDocument new
		add: (PRPreformatted new
			add: (PRText content: '|, {, }, *, *, [, ||, |{, |}, +, +');
			yourself);
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki.

]
