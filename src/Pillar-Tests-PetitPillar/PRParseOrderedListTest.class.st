Class {
	#name : #PRParseOrderedListTest,
	#superclass : #PRParseListTest,
	#category : #'Pillar-Tests-PetitPillar'
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
	nLine := self lineEnding.
	wiki := '#1' , nLine , '#2' , nLine , '-3'.
	tree := PRDocument new
		        add: (PROrderedList new
				         add: (self listItemWithText: '1');
				         add: (self listItemWithText: '2');
				         yourself);
		        add: (PRUnorderedList new
				         add: (self listItemWithText: '3');
				         yourself);
		        yourself.
	self parserAssertWiki: wiki equalsTree: tree
]

{ #category : #'tests-parsing' }
PRParseOrderedListTest >> testParseNested [

	| wiki tree nLine |
	nLine := self lineEnding.
	wiki := self wikiString , '1' , nLine , self wikiString
	        , self wikiString , '1.1' , nLine , self wikiString
	        , self wikiString , '1.2'.
	tree := PRDocument new
		        add: (self actualClass new
				         add: (PRListItem new
						          add: (PRText content: '1');
						          add: (self actualClass new
								           add: (self listItemWithText: '1.1');
								           add: (self listItemWithText: '1.2');
								           yourself);
						          yourself);
				         yourself);
		        yourself.
	self parserAssertWiki: wiki equalsTree: tree
]

{ #category : #private }
PRParseOrderedListTest >> wikiString [
	^ '#'
]
