Class {
	#name : #PRListTest,
	#superclass : #PRDocumentGroupTest,
	#category : #'Pillar-Tests-Core'
}

{ #category : #private }
PRListTest >> actualClass [
	^ PRList
]

{ #category : #private }
PRListTest >> listItemClass [
	^ PRListItem
]

{ #category : #private }
PRListTest >> listItemWithText: aString [
	^ self listItemClass new
		add: (PRText content: aString);
		yourself
]

{ #category : #private }
PRListTest >> textString: anObject level: anInteger [
	^ (2 to: anInteger) inject: '' into: [ :result :each | result , '	' ]
]

{ #category : #private }
PRListTest >> wikiString [
	self subclassResponsibility
]
