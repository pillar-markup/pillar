Class {
	#name : #PRPillarWriterUnorderedListTest,
	#superclass : #PRPillarWriterListTest,
	#category : #'Pillar-Tests-ExporterPillar'
}

{ #category : #testing }
PRPillarWriterUnorderedListTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarWriterUnorderedListTest >> actualClass [
	^ PRUnorderedList
]

{ #category : #'tests-parsing' }
PRPillarWriterUnorderedListTest >> testParseMixed [

	| wiki tree nLine |
	nLine := self lineEnding.
	wiki := '#1' , nLine , '##2' , nLine , '###3' , nLine , '#-4' , nLine
	        , '#-5' , nLine , '##6' , nLine , '#7'.
	tree := PRDocument new
		        add: (PROrderedList new
				         add: (PRListItem new
						          add: (PRText content: '1');
						          add: (PROrderedList new
								           add: (PRListItem new
										            add: (PRText content: '2');
										            add: (PROrderedList new
												             add: (self listItemWithText: '3');
												             yourself);
										            yourself);
								           yourself);
						          add: (PRUnorderedList new
								           add: (self listItemWithText: '4');
								           add: (self listItemWithText: '5');
								           yourself);
						          add: (PROrderedList new
								           add: (self listItemWithText: '6');
								           yourself);
						          yourself);
				         add: (self listItemWithText: '7');
				         yourself);
		        yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarWriterUnorderedListTest >> testParseNested [

	| wiki tree nLine |
	nLine := self lineEnding.
	wiki := self wikiString , '1' , nLine , self wikiString
	        , self wikiString , '1.1' , nLine , self wikiString
	        , self wikiString , self wikiString , '1.1.1'.

	tree := PRDocument new
		        add: (self actualClass new
				         add: (PRListItem new
						          add: (PRText content: '1');
						          add: (self actualClass new
								           add: (PRListItem new
										            add: (PRText content: '1.1');
										            add: (self actualClass new
												             add: (self listItemWithText: '1.1.1');
												             yourself);
										            yourself);
								           yourself);
						          yourself);
				         yourself);
		        yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #private }
PRPillarWriterUnorderedListTest >> textString: anObject level: anInteger [
	^ (super textString: anObject level: anInteger) , '* '
]

{ #category : #private }
PRPillarWriterUnorderedListTest >> wikiString [
	^ '-'
]
