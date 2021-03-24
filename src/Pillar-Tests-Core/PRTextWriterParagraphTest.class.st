Class {
	#name : #PRTextWriterParagraphTest,
	#superclass : #PRTextWriterDocumentGroupTest,
	#category : #'Pillar-Tests-Core-Structural'
}

{ #category : #testing }
PRTextWriterParagraphTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRTextWriterParagraphTest >> actualClass [
	^ PRParagraph
]

{ #category : #'tests-parsing' }
PRTextWriterParagraphTest >> testParseEmptyLineAtBeginning [

	| text tree |
	text := '' , self lineEnding , 'Lorem ipsum dolor sit amet.'.
	tree := PRDocument new
		        add: PREmptyParagraph new;
		        add: (PRParagraph new
				         add: (PRText content: 'Lorem ipsum dolor sit amet.');
				         yourself);
		        yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterParagraphTest >> testParseOneLine [
	| text tree |
	text := 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nulla quis urna.'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: text);
			yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterParagraphTest >> testParseThreeEmptyLines [

	| text tree nLine |
	nLine := self lineEnding.
	text := 'Lorem ipsum dolor sit amet.' , nLine , nLine , nLine
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
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterParagraphTest >> testParseTwoConsecutiveNonTextLines [

	| text tree sentence title nLine |
	nLine := self lineEnding.
	sentence := 'sentence'.
	title := 'title'.
	text := sentence , nLine , title.
	tree := PRDocument new
		        add: (PRParagraph new
				         add: (PRText content: sentence);
				         yourself);
		        add: (PRHeader new
				         level: 1;
				         add: (PRText content: title);
				         yourself);
		        yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterParagraphTest >> testParseTwoEmptyLines [

	| text tree nLine |
	nLine := self lineEnding.
	text := 'Lorem ipsum dolor sit amet.' , nLine , nLine
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
	self textWriterAssertTree: tree equalsText: text
]
