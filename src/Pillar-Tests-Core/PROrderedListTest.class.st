Class {
	#name : #PROrderedListTest,
	#superclass : #PRListTest,
	#category : #'Pillar-Tests-Core-Structural'
}

{ #category : #testing }
PROrderedListTest class >> isAbstract [
	^ false
]

{ #category : #private }
PROrderedListTest >> actualClass [
	^ PROrderedList
]

{ #category : #private }
PROrderedListTest >> textString: anObject level: anInteger [ 
	^ (super 
		textString: anObject
		level: anInteger) , anObject asString , '. '
]
