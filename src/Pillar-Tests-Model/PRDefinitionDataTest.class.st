Class {
	#name : #PRDefinitionDataTest,
	#superclass : #PRListTest,
	#category : #'Pillar-Tests-Model-Document'
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

{ #category : #private }
PRDefinitionDataTest >> textString: anObject level: anInteger [
	^ (super textString: anObject level: anInteger) , '  '
]

{ #category : #private }
PRDefinitionDataTest >> wikiString [
	^ ':'
]
