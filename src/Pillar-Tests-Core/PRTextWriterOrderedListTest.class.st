Class {
	#name : #PRTextWriterOrderedListTest,
	#superclass : #PRTextWriterListTest,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRTextWriterOrderedListTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRTextWriterOrderedListTest >> actualClass [
	^ PROrderedList
]

{ #category : #'tests-parsing' }
PRTextWriterOrderedListTest >> testParseNested [
	| text tree nLine |
	nLine := Smalltalk os lineEnding.
	text := (self textString: 1 level: 1) , '1' , nLine , (self textString: 1 level: 2) , '1.1' , nLine
		, (self textString: 2 level: 2) , '1.2'.
	tree := PRDocument new
		add:
				(self actualClass new
						add:
								(PRListItem new
										add: (PRText content: '1');
										add:
												(self actualClass new
														add: (self listItemWithText: '1.1');
														add: (self listItemWithText: '1.2');
														yourself);
										yourself);
						yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #private }
PRTextWriterOrderedListTest >> textString: anObject level: anInteger [ 
	^ (super textString: anObject level: anInteger) , anObject asString , '. '
]
