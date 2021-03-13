Class {
	#name : #PRTextWriterPreformattedTest,
	#superclass : #PRTextWriterDocumentGroupTest,
	#category : #'Pillar-Tests-Model-TextWriter'
}

{ #category : #testing }
PRTextWriterPreformattedTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRTextWriterPreformattedTest >> actualClass [
	^ PRPreformatted
]

{ #category : #'tests-parsing' }
PRTextWriterPreformattedTest >> testParseBasic [
	| text tree |
	text := 'Line'.
	tree := PRDocument new
		add: (PRPreformatted new
			add: (PRText content: 'Line');
			yourself);
		yourself.

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterPreformattedTest >> testParseEmpty [
	| text tree |
	text := ''.
	tree := PRDocument new
		add: (PRPreformatted new
			add: (PRText content: '');
			yourself);
		yourself.

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterPreformattedTest >> testParseMultiple [
	| text tree nLine |
	nLine := Smalltalk os lineEnding.

	text := 'line 1.1' , nLine , 'line 1.2' , nLine , nLine , 'line 2.1'.
	tree := PRDocument new
		add:
				(PRPreformatted new
						add: (PRText content: 'line 1.1');
						add: (PRText content: 'line 1.2');
						yourself);
		add: PREmptyParagraph new;
		add:
				(PRPreformatted new
						add: (PRText content: 'line 2.1');
						yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterPreformattedTest >> testParseSpaces [
	| text tree nLine |
	nLine := Smalltalk os lineEnding.
	text := '   A line with 3 spaces' , nLine , '	A line with a tab'.
	tree := PRDocument new
		add:
				(PRPreformatted new
						add: (PRText content: '   A line with 3 spaces');
						add: (PRText content: '	A line with a tab');
						yourself);
		yourself.

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterPreformattedTest >> testParseSpecials [
	| text tree |
	text := '|, {, }, *, *, [, ||, |{, |}, +, +'.
	tree := PRDocument new
		add: (PRPreformatted new
			add: (PRText content: '|, {, }, *, *, [, ||, |{, |}, +, +');
			yourself);
		yourself.

	self textWriterAssertTree: tree equalsText: text
]
