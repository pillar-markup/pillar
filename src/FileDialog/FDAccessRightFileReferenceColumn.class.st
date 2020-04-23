"
I'm a column use to give you the access right of a FileReference
"
Class {
	#name : #FDAccessRightFileReferenceColumn,
	#superclass : #FDAbstractStringTableColumn,
	#category : #'FileDialog-FileTreeStrategie'
}

{ #category : #adding }
FDAccessRightFileReferenceColumn class >> addContraintTo: aTableColumn [
	"do nothing"
]

{ #category : #templateMethod }
FDAccessRightFileReferenceColumn class >> columnTitle [
	"I'm returning a String for the title"

	^ 'Access right'
]

{ #category : #templateMethod }
FDAccessRightFileReferenceColumn class >> evaluateOn: aFileReference [
	"I'm provide action for fileReference"

	^ aFileReference permissions
]

{ #category : #sorting }
FDAccessRightFileReferenceColumn class >> sortValue [
	^ 50
]
