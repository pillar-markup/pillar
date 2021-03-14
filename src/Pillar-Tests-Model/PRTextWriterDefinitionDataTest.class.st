Class {
	#name : #PRTextWriterDefinitionDataTest,
	#superclass : #PRTextWriterListTest,
	#category : #'Pillar-Tests-Model-TextWriter'
}

{ #category : #testing }
PRTextWriterDefinitionDataTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRTextWriterDefinitionDataTest >> actualClass [
	^ PRDefinitionList
]

{ #category : #private }
PRTextWriterDefinitionDataTest >> listItemClass [
	^ PRDataItem
]

{ #category : #private }
PRTextWriterDefinitionDataTest >> textString: anObject level: anInteger [
	^ (super textString: anObject level: anInteger) , '  '
]

{ #category : #private }
PRTextWriterDefinitionDataTest >> wikiString [
	^ ':'
]
