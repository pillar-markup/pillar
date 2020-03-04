Class {
	#name : #PRLineBreakTest,
	#superclass : #PRDocumentItemTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRLineBreakTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRLineBreakTest >> actualClass [
	^ PRLineBreak
]

{ #category : #'tests-parsing' }
PRLineBreakTest >> testParseOneEmptyLine [
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := 'Lorem ipsum dolor sit amet.' , nLine , nLine , 'Nulla quis urna.'.
	text := wiki.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: 'Lorem ipsum dolor sit amet.');
						yourself);
		add: PREmptyParagraph new;
		add: (PRParagraph new add: (PRText content: 'Nulla quis urna.') yourself);
		yourself.
		
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRLineBreakTest >> testParseTreeLines [
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := 'Lorem ipsum dolor sit amet.' , nLine , 'Nulla quis urna.' , nLine , 'Vestibulum turpis.'.
	text := wiki.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: 'Lorem ipsum dolor sit amet.');
						add: PRLineBreak new;
						add: (PRText content: 'Nulla quis urna.');
						add: PRLineBreak new;
						add: (PRText content: 'Vestibulum turpis.');
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRLineBreakTest >> testParseTwoEmptyLines [
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := 'Lorem ipsum dolor sit amet.' , nLine , nLine , nLine , 'Nulla quis urna.'.
	text := wiki.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: 'Lorem ipsum dolor sit amet.');
						yourself);
		add: PREmptyParagraph new;
		add: PREmptyParagraph new;
		add: (PRParagraph new add: (PRText content: 'Nulla quis urna.') yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: text.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRLineBreakTest >> testParseTwoLines [
	| wiki text tree |
	wiki := 'Lorem ipsum dolor sit amet.' , Smalltalk os lineEnding , 'Nulla quis urna.'.
	text := wiki.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: 'Lorem ipsum dolor sit amet.');
						add: PRLineBreak new;
						add: (PRText content: 'Nulla quis urna.') yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]
