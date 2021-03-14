Class {
	#name : #PRDefinitionTermTest,
	#superclass : #PRListTest,
	#category : #'Pillar-Tests-Model-Document'
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

{ #category : #private }
PRDefinitionTermTest >> textString: anObject level: anInteger [
	^ (super textString: anObject level: anInteger) , '- '
]

{ #category : #private }
PRDefinitionTermTest >> wikiString [
	^ ';'
]
