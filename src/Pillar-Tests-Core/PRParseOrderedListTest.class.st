Class {
	#name : #PRParseOrderedListTest,
	#superclass : #PRParserListTest,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRParseOrderedListTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRParseOrderedListTest >> actualClass [
	^ PROrderedList
]

{ #category : #'tests-parsing' }
PRParseOrderedListTest >> testParseMixed [
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
	
]

{ #category : #'tests-parsing' }
PRParseOrderedListTest >> testParseNested [
	| wiki tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := self wikiString , '1' , nLine , self wikiString , self wikiString , '1.1' , nLine , self wikiString
		, self wikiString , '1.2'.
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

]

{ #category : #private }
PRParseOrderedListTest >> textString: anObject level: anInteger [ 
	^ (super 
		textString: anObject
		level: anInteger) , anObject asString , '. '
]

{ #category : #private }
PRParseOrderedListTest >> wikiString [
	^ '#'
]
