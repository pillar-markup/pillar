Class {
	#name : #PRTextWriterLineBreakTest,
	#superclass : #PRTextWriterDocumentItemTest3,
	#category : #'Pillar-Tests-Model-TextWriter'
}

{ #category : #testing }
PRTextWriterLineBreakTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRTextWriterLineBreakTest >> actualClass [
	^ PRLineBreak
]

{ #category : #'tests-parsing' }
PRTextWriterLineBreakTest >> testParseOneEmptyLine [
	| text tree nLine |
	nLine := Smalltalk os lineEnding.
	text := 'Lorem ipsum dolor sit amet.' , nLine , nLine , 'Nulla quis urna.'.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: 'Lorem ipsum dolor sit amet.');
						yourself);
		add: PREmptyParagraph new;
		add: (PRParagraph new add: (PRText content: 'Nulla quis urna.') yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterLineBreakTest >> testParseTreeLines [
	| text tree nLine |
	nLine := Smalltalk os lineEnding.
	text := 'Lorem ipsum dolor sit amet.' , nLine , 'Nulla quis urna.' , nLine , 'Vestibulum turpis.'.
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
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterLineBreakTest >> testParseTwoEmptyLines [
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
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterLineBreakTest >> testParseTwoLines [
	| text tree |
	text := 'Lorem ipsum dolor sit amet.' , Smalltalk os lineEnding , 'Nulla quis urna.'.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: 'Lorem ipsum dolor sit amet.');
						add: PRLineBreak new;
						add: (PRText content: 'Nulla quis urna.') yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]
