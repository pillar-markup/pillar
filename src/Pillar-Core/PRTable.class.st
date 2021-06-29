"
I am a table. My children are instances of *PRTableRow*.
"
Class {
	#name : #PRTable,
	#superclass : #PRDocumentGroup,
	#category : #'Pillar-Core'
}

{ #category : #visiting }
PRTable >> accept: aVisitor [
	^ aVisitor visitTable: self
]

{ #category : #accessing }
PRTable >> columnCount [
	^ self children inject: 0 into: [ :max :row | max max: row columnCount ]
]

{ #category : #accessing }
PRTable >> rowCount [
	^ self children size
]
