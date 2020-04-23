"
I'm a column use to display the creation date of a file
"
Class {
	#name : #FDCreationDateReferenceColumn,
	#superclass : #FDAbstractStringTableColumn,
	#category : #'FileDialog-FileTreeStrategie'
}

{ #category : #adding }
FDCreationDateReferenceColumn class >> addContraintTo: aTableColumn [
	"do nothing"
]

{ #category : #templateMethod }
FDCreationDateReferenceColumn class >> columnTitle [
	"I'm returning a String"
	^ 'Creation date'
]

{ #category : #templateMethod }
FDCreationDateReferenceColumn class >> evaluateOn: aFileReference [ 
	^ aFileReference creationTime asString
]

{ #category : #sorting }
FDCreationDateReferenceColumn class >> sortValue [
	^ 100
]
