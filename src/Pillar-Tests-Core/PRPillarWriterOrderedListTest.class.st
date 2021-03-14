Class {
	#name : #PRPillarWriterOrderedListTest,
	#superclass : #PRPillarWriterListTest,
	#category : #'Pillar-Tests-Core-PillarWriter'
}

{ #category : #testing }
PRPillarWriterOrderedListTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarWriterOrderedListTest >> actualClass [
	^ PROrderedList
]

{ #category : #'tests-parsing' }
PRPillarWriterOrderedListTest >> testParseMixed [

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

	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarWriterOrderedListTest >> testParseNested [

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

	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #private }
PRPillarWriterOrderedListTest >> textString: anObject level: anInteger [ 
	^ (super 
		textString: anObject
		level: anInteger) , anObject asString , '. '
]

{ #category : #private }
PRPillarWriterOrderedListTest >> wikiString [
	^ '#'
]
