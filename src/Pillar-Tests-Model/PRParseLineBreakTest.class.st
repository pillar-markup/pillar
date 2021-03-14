Class {
	#name : #PRParseLineBreakTest,
	#superclass : #PRParseDocumentItemTest,
	#category : #'Pillar-Tests-Model-Parser'
}

{ #category : #testing }
PRParseLineBreakTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRParseLineBreakTest >> actualClass [
	^ PRLineBreak
]

{ #category : #'tests-parsing' }
PRParseLineBreakTest >> testParseOneEmptyLine [
	| wiki tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := 'Lorem ipsum dolor sit amet.' , nLine , nLine , 'Nulla quis urna.'.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: 'Lorem ipsum dolor sit amet.');
						yourself);
		add: PREmptyParagraph new;
		add: (PRParagraph new add: (PRText content: 'Nulla quis urna.') yourself);
		yourself.
		
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseLineBreakTest >> testParseTreeLines [
	| wiki tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := 'Lorem ipsum dolor sit amet.' , nLine , 'Nulla quis urna.' , nLine , 'Vestibulum turpis.'.
	
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
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseLineBreakTest >> testParseTwoEmptyLines [
	| wiki tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := 'Lorem ipsum dolor sit amet.' , nLine , nLine , nLine , 'Nulla quis urna.'.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: 'Lorem ipsum dolor sit amet.');
						yourself);
		add: PREmptyParagraph new;
		add: PREmptyParagraph new;
		add: (PRParagraph new add: (PRText content: 'Nulla quis urna.') yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseLineBreakTest >> testParseTwoLines [
	| wiki tree |
	wiki := 'Lorem ipsum dolor sit amet.' , Smalltalk os lineEnding , 'Nulla quis urna.'.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: 'Lorem ipsum dolor sit amet.');
						add: PRLineBreak new;
						add: (PRText content: 'Nulla quis urna.') yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]
