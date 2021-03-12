Class {
	#name : #PRTextWriterUnorderedListTest,
	#superclass : #PRTextWriterListTest,
	#category : #'Pillar-Tests-Core-TextWriter'
}

{ #category : #testing }
PRTextWriterUnorderedListTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRTextWriterUnorderedListTest >> actualClass [
	^ PRUnorderedList
]

{ #category : #'tests-parsing' }
PRTextWriterUnorderedListTest >> testParseMixed [
	| tree text nLine |
	nLine := Smalltalk os lineEnding.
	text := '1. 1' , nLine , '	1. 2' , nLine , '		1. 3' , nLine , '	* 4' , nLine , '	* 5' , nLine , '	1. 6' , nLine
		, '2. 7'.
	tree := PRDocument new
		add:
				(PROrderedList new
						add:
								(PRListItem new
										add: (PRText content: '1');
										add:
												(PROrderedList new
														add:
																(PRListItem new
																		add: (PRText content: '2');
																		add:
																				(PROrderedList new
																						add: (self listItemWithText: '3');
																						yourself);
																		yourself);
														yourself);
										add:
												(PRUnorderedList new
														add: (self listItemWithText: '4');
														add: (self listItemWithText: '5');
														yourself);
										add:
												(PROrderedList new
														add: (self listItemWithText: '6');
														yourself);
										yourself);
						add: (self listItemWithText: '7');
						yourself);
		yourself.
	
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterUnorderedListTest >> testParseNested [
	| text tree nLine |
	nLine := Smalltalk os lineEnding.
	text := (self textString: 1 level: 1) , '1' , nLine , (self textString: 1 level: 2) , '1.1' , nLine
		, (self textString: 1 level: 3) , '1.1.1'.
	tree := PRDocument new
		add:
				(self actualClass new
						add:
								(PRListItem new
										add: (PRText content: '1');
										add:
												(self actualClass new
														add:
																(PRListItem new
																		add: (PRText content: '1.1');
																		add:
																				(self actualClass new
																						add: (self listItemWithText: '1.1.1');
																						yourself);
																		yourself);
														yourself);
										yourself);
						yourself);
		yourself.

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #private }
PRTextWriterUnorderedListTest >> textString: anObject level: anInteger [
	^ (super textString: anObject level: anInteger) , '* '
]
