"
I am a cell of a table.
"
Class {
	#name : #PRTableCell,
	#superclass : #PRDocumentGroup,
	#instVars : [
		'align',
		'heading'
	],
	#category : #'Pillar-Model-Document'
}

{ #category : #'instance creation' }
PRTableCell class >> align: aSymbolePosition heading: aBoolean withAll: aCollection [
	^ (self withAll: aCollection)
		align: aSymbolePosition;
		heading: aBoolean;
		yourself
]

{ #category : #comparing }
PRTableCell >> = anObject [
	^ super = anObject
		and: [ self align = anObject align
		and: [ self heading = anObject heading ] ]
]

{ #category : #visiting }
PRTableCell >> accept: aVisitor [
	^ aVisitor visitTableCell: self
]

{ #category : #accessing }
PRTableCell >> align [
	^ align
]

{ #category : #accessing }
PRTableCell >> align: aSymbol [
	align := aSymbol
]

{ #category : #actions }
PRTableCell >> beAlignedCenter [
	self align: #center
]

{ #category : #actions }
PRTableCell >> beAlignedLeft [
	self align: #left
]

{ #category : #actions }
PRTableCell >> beAlignedRight [
	self align: #right
]

{ #category : #actions }
PRTableCell >> beHeading [
	self heading: true
]

{ #category : #comparing }
PRTableCell >> hash [
	^ super hash bitXor: self align hash
]

{ #category : #accessing }
PRTableCell >> heading [
	^ heading
]

{ #category : #accessing }
PRTableCell >> heading: aBoolean [
	heading := aBoolean
]

{ #category : #initialization }
PRTableCell >> initialize [
	super initialize.
	heading := false
]

{ #category : #testing }
PRTableCell >> isAligned [
	^ self align isNotNil
]

{ #category : #testing }
PRTableCell >> isAlignedCenter [
	^ self align = #center
]

{ #category : #testing }
PRTableCell >> isAlignedLeft [
	^ self align = #left
]

{ #category : #testing }
PRTableCell >> isAlignedRight [
	^ self align = #right
]

{ #category : #testing }
PRTableCell >> isHeading [
	^ self heading
]
