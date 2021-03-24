Class {
	#name : #PRTextWriterAnnotatedParagraphTest,
	#superclass : #PRTextWriterDocumentGroupTest,
	#category : #'Pillar-Tests-ExporterText'
}

{ #category : #testing }
PRTextWriterAnnotatedParagraphTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRTextWriterAnnotatedParagraphTest >> actualClass [
	^ PRAnnotatedParagraph
]

{ #category : #'tests-parsing' }
PRTextWriterAnnotatedParagraphTest >> testParseBasic [
	| text tree |
	text := 'bar zork'.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			annotation: 'foo';
			add: (PRText content: 'bar zork');
			yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterAnnotatedParagraphTest >> testParseEmptyFollwedByPreformatted [

	| text tree nLine |
	nLine := self lineEnding.
	text := nLine , 'bar'.
	tree := PRDocument new
		        add: (PRAnnotatedParagraph new
				         annotation: 'foo';
				         yourself);
		        add: (PRPreformatted new
				         add: (PRText content: 'bar');
				         yourself);
		        yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterAnnotatedParagraphTest >> testParseOnlyAnnotation [
	| text tree |
	text := ''.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			annotation: 'foo';
			yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterAnnotatedParagraphTest >> testParseOnlyNothing [
	| text tree |
	text := ''.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			annotation: '';
			yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterAnnotatedParagraphTest >> testParseOnlyText [
	| text tree |
	text := 'foo bar'.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			add: (PRText content: 'foo bar');
			annotation: '';
			yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]
