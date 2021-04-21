Class {
	#name : #PRPillarWriterDefinitionDataTest,
	#superclass : #PRPillarWriterListTest,
	#category : #'Pillar-Tests-Model-ExporterPillar'
}

{ #category : #testing }
PRPillarWriterDefinitionDataTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarWriterDefinitionDataTest >> actualClass [
	^ PRDefinitionList
]

{ #category : #private }
PRPillarWriterDefinitionDataTest >> listItemClass [
	^ PRDataItem
]

{ #category : #tests }
PRPillarWriterDefinitionDataTest >> testParseBug [

	| wiki2 tree nLine |
	nLine := self lineEnding.
	wiki2 := ':' , nLine , '::1' , nLine , '::-2'.
	tree := PRDocument new
		        add: (PRDefinitionList new
				         add: (PRDataItem new
						          add: (PRDefinitionList new
								           add: (PRDataItem new
										            add: (PRText content: '1');
										            add: (PRUnorderedList new
												             add: (PRListItem new
														              add: (PRText content: '2');
														              yourself);
												             yourself);
										            yourself);
								           yourself);
						          yourself);
				         yourself);
		        yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki2
]

{ #category : #tests }
PRPillarWriterDefinitionDataTest >> testParseMixed [

	| wiki tree |
	wiki := ';1' , self lineEnding , ':2'.
	tree := PRDocument new
		        add: (PRDefinitionList new
				         add: (PRTermItem new
						          add: (PRText content: '1');
						          yourself);
				         add: (PRDataItem new
						          add: (PRText content: '2');
						          yourself);
				         yourself);
		        yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #private }
PRPillarWriterDefinitionDataTest >> textString: anObject level: anInteger [
	^ (super textString: anObject level: anInteger) , '  '
]

{ #category : #private }
PRPillarWriterDefinitionDataTest >> wikiString [
	^ ':'
]
