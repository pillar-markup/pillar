Class {
	#name : #PRPillarWriterDefinitionTermTest,
	#superclass : #PRPillarWriterListTest,
	#category : #'Pillar-Tests-Model-PillarWriter'
}

{ #category : #testing }
PRPillarWriterDefinitionTermTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarWriterDefinitionTermTest >> actualClass [
	^ PRDefinitionList
]

{ #category : #private }
PRPillarWriterDefinitionTermTest >> listItemClass [
	^ PRTermItem
]

{ #category : #tests }
PRPillarWriterDefinitionTermTest >> testParseMixed [
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
	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #private }
PRPillarWriterDefinitionTermTest >> textString: anObject level: anInteger [
	^ (super textString: anObject level: anInteger) , '- '
]

{ #category : #private }
PRPillarWriterDefinitionTermTest >> wikiString [
	^ ';'
]
