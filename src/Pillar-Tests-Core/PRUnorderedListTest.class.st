Class {
	#name : #PRUnorderedListTest,
	#superclass : #PRListTest,
	#category : #'Pillar-Tests-Core-Structural'
}

{ #category : #testing }
PRUnorderedListTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRUnorderedListTest >> actualClass [
	^ PRUnorderedList
]

{ #category : #private }
PRUnorderedListTest >> textString: anObject level: anInteger [
	^ (super textString: anObject level: anInteger) , '* '
]
