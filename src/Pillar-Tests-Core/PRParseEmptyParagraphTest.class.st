Class {
	#name : #PRParseEmptyParagraphTest,
	#superclass : #PRParseParagraphTest,
	#category : #'Pillar-Tests-Core-Parse'
}

{ #category : #private }
PRParseEmptyParagraphTest >> actualClass [
	^ PREmptyParagraph
]

{ #category : #tests }
PRParseEmptyParagraphTest >> testParseEmptyParagraphAtBeginning [

	| wiki tree content |
	content := 'Lorem ipsum dolor sit amet.'.
	wiki := self lineEnding , content.
	tree := PRDocument new
		        add: PREmptyParagraph new;
		        add: (PRParagraph new
				         add: (PRText content: content);
				         yourself);
		        yourself.
	self parserAssertWiki: wiki equalsTree: tree
]

{ #category : #tests }
PRParseEmptyParagraphTest >> testParseEmptyParagraphInTheMiddle [

	| wiki tree content nLine |
	nLine := self lineEnding.
	content := 'Lorem ipsum dolor sit amet.'.
	wiki := content , nLine , nLine , content.
	tree := PRDocument new
		        add: (PRParagraph new
				         add: (PRText content: content);
				         yourself);
		        add: PREmptyParagraph new;
		        add: (PRParagraph new
				         add: (PRText content: content);
				         yourself);
		        yourself.
	self parserAssertWiki: wiki equalsTree: tree
]
