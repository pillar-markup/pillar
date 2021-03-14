Class {
	#name : #PRPillarWriterLineBreakTest,
	#superclass : #PRPillarWriterDocumentItemTest4,
	#category : #'Pillar-Tests-Model-PillarWriter'
}

{ #category : #testing }
PRPillarWriterLineBreakTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarWriterLineBreakTest >> actualClass [
	^ PRLineBreak
]

{ #category : #'tests-parsing' }
PRPillarWriterLineBreakTest >> testParseOneEmptyLine [
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
		
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
	
]

{ #category : #'tests-parsing' }
PRPillarWriterLineBreakTest >> testParseTreeLines [
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
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterLineBreakTest >> testParseTwoEmptyLines [
	| text tree nLine |
	nLine := Smalltalk os lineEnding.
	text := 'Lorem ipsum dolor sit amet.' , nLine , nLine , nLine , 'Nulla quis urna.'.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: 'Lorem ipsum dolor sit amet.');
						yourself);
		add: PREmptyParagraph new;
		add: PREmptyParagraph new;
		add: (PRParagraph new add: (PRText content: 'Nulla quis urna.') yourself);
		yourself.
	self pillarWriterAssertTree: tree equalsWiki: text.

]

{ #category : #'tests-parsing' }
PRPillarWriterLineBreakTest >> testParseTwoLines [
	| wiki tree |
	wiki := 'Lorem ipsum dolor sit amet.' , Smalltalk os lineEnding , 'Nulla quis urna.'.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: 'Lorem ipsum dolor sit amet.');
						add: PRLineBreak new;
						add: (PRText content: 'Nulla quis urna.') yourself);
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]
