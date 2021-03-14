Class {
	#name : #PRParseDefinitionDataTest,
	#superclass : #PRParseListTest,
	#category : #'Pillar-Tests-Model-Parser'
}

{ #category : #testing }
PRParseDefinitionDataTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRParseDefinitionDataTest >> actualClass [
	^ PRDefinitionList
]

{ #category : #private }
PRParseDefinitionDataTest >> listItemClass [
	^ PRDataItem
]

{ #category : #tests }
PRParseDefinitionDataTest >> testParseBug [
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
	self parserAssertWiki: wiki1 equalsTree: tree.
	self parserAssertWiki: wiki2 equalsTree: tree.
	
]

{ #category : #tests }
PRParseDefinitionDataTest >> testParseMixed [
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
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #private }
PRParseDefinitionDataTest >> textString: anObject level: anInteger [
	^ (super textString: anObject level: anInteger) , '  '
]

{ #category : #private }
PRParseDefinitionDataTest >> wikiString [
	^ ':'
]
