Class {
	#name : #PRPillarWriterListTest,
	#superclass : #PRPillarWriterDocumentGroupTest,
	#category : #'Pillar-Tests-Core'
}

{ #category : #private }
PRPillarWriterListTest >> actualClass [
	^ PRList
]

{ #category : #private }
PRPillarWriterListTest >> listItemClass [
	^ PRListItem
]

{ #category : #private }
PRPillarWriterListTest >> listItemWithText: aString [
	^ self listItemClass new
		add: (PRText content: aString);
		yourself
]

{ #category : #'tests-parsing' }
PRPillarWriterListTest >> testParseEmpty [
	| wiki tree |
	wiki := self wikiString.
	tree := PRDocument new
		add: (self actualClass new
			add: self listItemClass new;
			yourself);
		yourself.
	
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterListTest >> testParseFlat [
	| wiki tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := self wikiString , '1st' , nLine , self wikiString , '2nd' , nLine , self wikiString , '3rd'.
	tree := PRDocument new
		add:
				(self actualClass new
						add: (self listItemWithText: '1st');
						add: (self listItemWithText: '2nd');
						add: (self listItemWithText: '3rd');
						yourself);
		yourself.
	
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterListTest >> testParseMultiple [
	| wiki tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := self wikiString , '1st' , nLine , self wikiString , '2nd' , nLine , nLine , self wikiString , '3rd'.
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
	
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #private }
PRPillarWriterListTest >> textString: anObject level: anInteger [
	^ (2 to: anInteger) inject: '' into: [ :result :each | result , '	' ]
]

{ #category : #private }
PRPillarWriterListTest >> wikiString [
	self subclassResponsibility
]
