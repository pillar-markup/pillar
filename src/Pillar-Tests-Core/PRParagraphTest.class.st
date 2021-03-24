Class {
	#name : #PRParagraphTest,
	#superclass : #PRDocumentGroupTest,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRParagraphTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRParagraphTest >> actualClass [
	^ PRParagraph
]

{ #category : #'tests-parsing' }
PRParagraphTest >> testParent [
	| tree text |
	text := PRText content: 'Lorem ipsum dolor sit amet.'.
	tree := PRDocument new
		add: PREmptyParagraph new;
		add:
				(PRParagraph new
						add: text;
						yourself);
		yourself.
	self assert: tree children first parent equals: tree.
	self assert: tree children second parent equals: tree.
	self assert: text parent equals: tree children second
]
