"
I am a row of a table. My children are instances of *PRTableCell*.
"
Class {
	#name : #PRTableRow,
	#superclass : #PRDocumentGroup,
	#category : #'Pillar-Model-Document'
}

{ #category : #visiting }
PRTableRow >> accept: aVisitor [
	^ aVisitor visitTableRow: self
]

{ #category : #accessing }
PRTableRow >> columnCount [
	^ self children size
]

{ #category : #testing }
PRTableRow >> isHeading [
	"For a row to be considered a heading row, all cells must be either heading or empty. A totally empty row is not considered a heading row."

	^ (self children anySatisfy: [ :cell | cell hasChildren ])
		and: [ self children allSatisfy: [ :cell | cell isHeading or: [ cell hasChildren not ] ] ]
]
