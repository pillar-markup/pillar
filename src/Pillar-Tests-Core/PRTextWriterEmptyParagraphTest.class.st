Class {
	#name : #PRTextWriterEmptyParagraphTest,
	#superclass : #PRTextWriterParagraphTest,
	#category : #'Pillar-Tests-Core-Structural'
}

{ #category : #private }
PRTextWriterEmptyParagraphTest >> actualClass [
	^ PREmptyParagraph
]

{ #category : #tests }
PRTextWriterEmptyParagraphTest >> testParseEmptyParagraphAtBeginning [

	| text tree content |
	content := 'Lorem ipsum dolor sit amet.'.
	text := self lineEnding , content.
	tree := PRDocument new
		        add: PREmptyParagraph new;
		        add: (PRParagraph new
				         add: (PRText content: content);
				         yourself);
		        yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #tests }
PRTextWriterEmptyParagraphTest >> testParseEmptyParagraphInTheMiddle [

	| text tree content nLine |
	nLine := self lineEnding.
	content := 'Lorem ipsum dolor sit amet.'.
	text := content , nLine , nLine , content.
	tree := PRDocument new
		        add: (PRParagraph new
				         add: (PRText content: content);
				         yourself);
		        add: PREmptyParagraph new;
		        add: (PRParagraph new
				         add: (PRText content: content);
				         yourself);
		        yourself.
	self textWriterAssertTree: tree equalsText: text
]
