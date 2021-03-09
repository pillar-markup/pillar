Class {
	#name : #PRTextWriterListTest,
	#superclass : #PRTextWriterDocumentGroupTest,
	#category : #'Pillar-Tests-Core'
}

{ #category : #private }
PRTextWriterListTest >> actualClass [
	^ PRList
]

{ #category : #private }
PRTextWriterListTest >> listItemClass [
	^ PRListItem
]

{ #category : #private }
PRTextWriterListTest >> listItemWithText: aString [
	^ self listItemClass new
		add: (PRText content: aString);
		yourself
]

{ #category : #'tests-parsing' }
PRTextWriterListTest >> testParseEmpty [
	| text tree |
	text := self textString: 1 level: 1.
	tree := PRDocument new
		add: (self actualClass new
			add: self listItemClass new;
			yourself);
		yourself.
		
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterListTest >> testParseFlat [
	| text tree nLine |
	nLine := Smalltalk os lineEnding.
	text := (self textString: 1 level: 1) , '1st' , nLine , (self textString: 2 level: 1) , '2nd' , nLine
		, (self textString: 3 level: 1) , '3rd'.
	tree := PRDocument new
		add:
				(self actualClass new
						add: (self listItemWithText: '1st');
						add: (self listItemWithText: '2nd');
						add: (self listItemWithText: '3rd');
						yourself);
		yourself.

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterListTest >> testParseMultiple [
	| text tree nLine |
	nLine := Smalltalk os lineEnding.
	text := (self textString: 1 level: 1) , '1st' , nLine , (self textString: 2 level: 1) , '2nd' , nLine , nLine
		, (self textString: 1 level: 1) , '3rd'.
	tree := PRDocument new
		add:
				(self actualClass new
						add: (self listItemWithText: '1st');
						add: (self listItemWithText: '2nd');
						yourself);
		add: PREmptyParagraph new;
		add:
				(self actualClass new
						add: (self listItemWithText: '3rd');
						yourself);
		yourself.

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #private }
PRTextWriterListTest >> textString: anObject level: anInteger [
	^ (2 to: anInteger) inject: '' into: [ :result :each | result , '	' ]
]

{ #category : #private }
PRTextWriterListTest >> wikiString [
	self subclassResponsibility
]
