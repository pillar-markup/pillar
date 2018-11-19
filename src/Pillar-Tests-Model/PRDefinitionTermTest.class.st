Class {
	#name : #PRDefinitionTermTest,
	#superclass : #PRListTest,
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRDefinitionTermTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRDefinitionTermTest >> actualClass [
	^ PRDefinitionList
]

{ #category : #private }
PRDefinitionTermTest >> listItemClass [
	^ PRTermItem
]

{ #category : #tests }
PRDefinitionTermTest >> testParseMixed [
	| wiki tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := ';1' , nLine , ';2' , nLine , ':3' , nLine , ':4'.
	tree := PRDocument new
		add:
				(PRDefinitionList new
						add:
								(PRTermItem new
										add: (PRText content: '1');
										yourself);
						add:
								(PRTermItem new
										add: (PRText content: '2');
										yourself);
						add:
								(PRDataItem new
										add: (PRText content: '3');
										yourself);
						add:
								(PRDataItem new
										add: (PRText content: '4');
										yourself);
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki
]

{ #category : #private }
PRDefinitionTermTest >> textString: anObject level: anInteger [
	^ (super textString: anObject level: anInteger) , '- '
]

{ #category : #private }
PRDefinitionTermTest >> wikiString [
	^ ';'
]
