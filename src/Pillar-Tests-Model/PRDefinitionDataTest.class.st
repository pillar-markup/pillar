Class {
	#name : #PRDefinitionDataTest,
	#superclass : #PRListTest,
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRDefinitionDataTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRDefinitionDataTest >> actualClass [
	^ PRDefinitionList
]

{ #category : #private }
PRDefinitionDataTest >> listItemClass [
	^ PRDataItem
]

{ #category : #tests }
PRDefinitionDataTest >> testParseBug [
	| wiki1 wiki2 tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki1 := '::1' , nLine , '::-2'.
	wiki2 := ':' , nLine , '::1' , nLine , '::-2'.
	tree := PRDocument new
		add:
				(PRDefinitionList new
						add:
								(PRDataItem new
										add:
												(PRDefinitionList new
														add:
																(PRDataItem new
																		add: (PRText content: '1');
																		add:
																				(PRUnorderedList new
																						add:
																								(PRListItem new
																										add: (PRText content: '2');
																										yourself);
																						yourself);
																		yourself);
														yourself);
										yourself);
						yourself);
		yourself.
	self assertWiki: wiki1 equalsTree: tree.
	self assertWiki: wiki2 equalsTree: tree.
	self assertTree: tree equalsWiki: wiki2
]

{ #category : #tests }
PRDefinitionDataTest >> testParseMixed [
	| wiki tree |
	wiki := ';1' , Smalltalk os lineEnding , ':2'.
	tree := PRDocument new
		add:
				(PRDefinitionList new
						add:
								(PRTermItem new
										add: (PRText content: '1');
										yourself);
						add:
								(PRDataItem new
										add: (PRText content: '2');
										yourself);
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki
]

{ #category : #private }
PRDefinitionDataTest >> textString: anObject level: anInteger [
	^ (super textString: anObject level: anInteger) , '  '
]

{ #category : #private }
PRDefinitionDataTest >> wikiString [
	^ ':'
]
