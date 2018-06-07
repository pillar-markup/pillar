"
I am a structure representation.

[[[structure=city
{
   ""name""        : ""Bordeaux"",
   ""latitude""    : 44.84, [...]
}
]]]

The idea is that I can be expanded in document items but it needs another pass. 
"
Class {
	#name : #PRStructure,
	#superclass : #PRDocumentItem,
	#instVars : [
		'tag',
		'structDict'
	],
	#category : 'Pillar-Model-Feature - structures'
}

{ #category : #testing }
PRStructure class >> isAbstract [
	^false
]

{ #category : #visiting }
PRStructure >> accept: aVisitor [
	aVisitor visitStructure: self
]

{ #category : #accesing }
PRStructure >> structDict [
	^ structDict ifNil: [ Dictionary new ]
]

{ #category : #accesing }
PRStructure >> structDict: aDictionary [
	structDict := aDictionary
]

{ #category : #accesing }
PRStructure >> tag [
 ^ 	tag ifNil: [ 'default' ]
]

{ #category : #accesing }
PRStructure >> tag: aTag [
	tag := aTag
]
