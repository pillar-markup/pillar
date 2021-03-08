Class {
	#name : #PROrderedListTest3,
	#superclass : #PRListTest3,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PROrderedListTest3 class >> isAbstract [
	^ false
]

{ #category : #private }
PROrderedListTest3 >> actualClass [
	^ PROrderedList
]

{ #category : #'tests-parsing' }
PROrderedListTest3 >> testParseMixed [
	| wiki tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '#1' , nLine , '#2' , nLine , '-3'.
	tree := PRDocument new
		add:
				(PROrderedList new
						add: (self listItemWithText: '1');
						add: (self listItemWithText: '2');
						yourself);
		add:
				(PRUnorderedList new
						add: (self listItemWithText: '3');
						yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PROrderedListTest3 >> testParseNested [
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := self wikiString , '1' , nLine , self wikiString , self wikiString , '1.1' , nLine , self wikiString
		, self wikiString , '1.2'.
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
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #private }
PROrderedListTest3 >> textString: anObject level: anInteger [ 
	^ (super 
		textString: anObject
		level: anInteger) , anObject asString , '. '
]

{ #category : #private }
PROrderedListTest3 >> wikiString [
	^ '#'
]
