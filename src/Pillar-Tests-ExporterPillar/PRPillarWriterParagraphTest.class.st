Class {
	#name : #PRPillarWriterParagraphTest,
	#superclass : #PRPillarWriterDocumentGroupTest,
	#category : #'Pillar-Tests-ExporterPillar'
}

{ #category : #testing }
PRPillarWriterParagraphTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarWriterParagraphTest >> actualClass [
	^ PRParagraph
]

{ #category : #'tests-parsing' }
PRPillarWriterParagraphTest >> testParseEmptyLineAtBeginning [

	| wiki tree |
	wiki := '' , self lineEnding , 'Lorem ipsum dolor sit amet.'.
	tree := PRDocument new
		        add: PREmptyParagraph new;
		        add: (PRParagraph new
				         add: (PRText content: 'Lorem ipsum dolor sit amet.');
				         yourself);
		        yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarWriterParagraphTest >> testParseOneLine [
	| wiki tree |
	wiki := 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nulla quis urna.'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: wiki);
			yourself);
		yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterParagraphTest >> testParseThreeEmptyLines [

	| wiki tree nLine |
	nLine := self lineEnding.
	wiki := 'Lorem ipsum dolor sit amet.' , nLine , nLine , nLine
	        , 'Nulla mattis elementum nulla.'.

	tree := PRDocument new
		        add: (PRParagraph new
				         add: (PRText content: 'Lorem ipsum dolor sit amet.');
				         yourself);
		        add: PREmptyParagraph new;
		        add: PREmptyParagraph new;
		        add: (PRParagraph new
				         add: (PRText content: 'Nulla mattis elementum nulla.');
				         yourself);
		        yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarWriterParagraphTest >> testParseTwoConsecutiveNonTextLines [

	| wiki tree sentence title nLine |
	nLine := self lineEnding.
	sentence := 'sentence'.
	title := 'title'.
	wiki := sentence , nLine , '!' , title.
	tree := PRDocument new
		        add: (PRParagraph new
				         add: (PRText content: sentence);
				         yourself);
		        add: (PRHeader new
				         level: 1;
				         add: (PRText content: title);
				         yourself);
		        yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarWriterParagraphTest >> testParseTwoEmptyLines [

	| wiki tree nLine |
	nLine := self lineEnding.
	wiki := 'Lorem ipsum dolor sit amet.' , nLine , nLine
	        , 'Nulla mattis elementum nulla.'.
	tree := PRDocument new
		        add: (PRParagraph new
				         add: (PRText content: 'Lorem ipsum dolor sit amet.');
				         yourself);
		        add: PREmptyParagraph new;
		        add: (PRParagraph new
				         add: (PRText content: 'Nulla mattis elementum nulla.');
				         yourself);
		        yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki
]
