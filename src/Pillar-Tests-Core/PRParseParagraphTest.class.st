Class {
	#name : #PRParseParagraphTest,
	#superclass : #PRParseDocumentGroupTest,
	#category : #'Pillar-Tests-Core-Parse'
}

{ #category : #testing }
PRParseParagraphTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRParseParagraphTest >> actualClass [
	^ PRParagraph
]

{ #category : #'tests-parsing' }
PRParseParagraphTest >> testParseEmptyLineAtBeginning [
	| wiki tree |
	wiki := '' , Smalltalk os lineEnding , 'Lorem ipsum dolor sit amet.'.
	tree := PRDocument new
		add: PREmptyParagraph new;
		add:
				(PRParagraph new
						add: (PRText content: 'Lorem ipsum dolor sit amet.');
						yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseParagraphTest >> testParseOneLine [
	| wiki tree |
	wiki := 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nulla quis urna.'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: wiki);
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseParagraphTest >> testParseThreeEmptyLines [
	| wiki tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := 'Lorem ipsum dolor sit amet.' , nLine , nLine , nLine , 'Nulla mattis elementum nulla.'.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: 'Lorem ipsum dolor sit amet.');
						yourself);
		add: PREmptyParagraph new;
		add: PREmptyParagraph new;
		add:
				(PRParagraph new
						add: (PRText content: 'Nulla mattis elementum nulla.');
						yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseParagraphTest >> testParseTwoConsecutiveNonTextLines [
	| wiki tree sentence title nLine |
	nLine := Smalltalk os lineEnding.
	sentence := 'sentence'.
	title := 'title'.
	wiki := sentence , nLine , '!' , title.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: sentence);
						yourself);
		add:
				(PRHeader new
						level: 1;
						add: (PRText content: title);
						yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseParagraphTest >> testParseTwoEmptyLines [
	| wiki tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := 'Lorem ipsum dolor sit amet.' , nLine , nLine , 'Nulla mattis elementum nulla.'.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: 'Lorem ipsum dolor sit amet.');
						yourself);
		add: PREmptyParagraph new;
		add:
				(PRParagraph new
						add: (PRText content: 'Nulla mattis elementum nulla.');
						yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]
