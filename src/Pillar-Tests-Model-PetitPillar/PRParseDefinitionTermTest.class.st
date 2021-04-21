Class {
	#name : #PRParseDefinitionTermTest,
	#superclass : #PRParseListTest,
	#category : #'Pillar-Tests-Model-PetitPillar'
}

{ #category : #testing }
PRParseDefinitionTermTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRParseDefinitionTermTest >> actualClass [
	^ PRDefinitionList
]

{ #category : #private }
PRParseDefinitionTermTest >> listItemClass [
	^ PRTermItem
]

{ #category : #tests }
PRParseDefinitionTermTest >> testParseMixed [

	| wiki tree nLine |
	nLine := self lineEnding.
	wiki := ';1' , nLine , ';2' , nLine , ':3' , nLine , ':4'.
	tree := PRDocument new
		        add: (PRDefinitionList new
				         add: (PRTermItem new
						          add: (PRText content: '1');
						          yourself);
				         add: (PRTermItem new
						          add: (PRText content: '2');
						          yourself);
				         add: (PRDataItem new
						          add: (PRText content: '3');
						          yourself);
				         add: (PRDataItem new
						          add: (PRText content: '4');
						          yourself);
				         yourself);
		        yourself.
	self parserAssertWiki: wiki equalsTree: tree
]

{ #category : #private }
PRParseDefinitionTermTest >> textString: anObject level: anInteger [
	^ (super textString: anObject level: anInteger) , '- '
]

{ #category : #private }
PRParseDefinitionTermTest >> wikiString [
	^ ';'
]
