Class {
	#name : #PREmptyParagraphTest,
	#superclass : #PRParagraphTest,
	#category : #'Pillar-Tests-Core'
}

{ #category : #private }
PREmptyParagraphTest >> actualClass [
	^ PREmptyParagraph
]

{ #category : #tests }
PREmptyParagraphTest >> testParseEmptyParagraphAtBeginning [
	| wiki text tree content |
	content := 'Lorem ipsum dolor sit amet.'.
	wiki := Smalltalk os lineEnding , content.
	text := wiki.
	tree := PRDocument new
		add: PREmptyParagraph new;
		add:
				(PRParagraph new
						add: (PRText content: content);
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #tests }
PREmptyParagraphTest >> testParseEmptyParagraphInTheMiddle [
	| wiki text tree content nLine|
	nLine := Smalltalk os lineEnding.
	content := 'Lorem ipsum dolor sit amet.'.
	wiki := content , nLine , nLine , content.
	text := wiki.
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
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]
