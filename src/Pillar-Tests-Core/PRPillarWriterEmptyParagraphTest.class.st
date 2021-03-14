Class {
	#name : #PRPillarWriterEmptyParagraphTest,
	#superclass : #PRPillarWriterParagraphTest,
	#category : #'Pillar-Tests-Core-PillarWriter'
}

{ #category : #private }
PRPillarWriterEmptyParagraphTest >> actualClass [
	^ PREmptyParagraph
]

{ #category : #tests }
PRPillarWriterEmptyParagraphTest >> testParseEmptyParagraphAtBeginning [
	| wiki tree content |
	content := 'Lorem ipsum dolor sit amet.'.
	wiki := Smalltalk os lineEnding , content.
	tree := PRDocument new
		add: PREmptyParagraph new;
		add:
				(PRParagraph new
						add: (PRText content: content);
						yourself);
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #tests }
PRPillarWriterEmptyParagraphTest >> testParseEmptyParagraphInTheMiddle [
	| wiki tree content nLine|
	nLine := Smalltalk os lineEnding.
	content := 'Lorem ipsum dolor sit amet.'.
	wiki := content , nLine , nLine , content.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: content);
						yourself);
		add: PREmptyParagraph new;
		add:
				(PRParagraph new
						add: (PRText content: content);
						yourself);
		yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki.

]
