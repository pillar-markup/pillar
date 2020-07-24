"
I am a class use for sorting files according their basename.
By default it is ascending sorting.

PRDocListNameSorter with: aCollectionOfReferences
"
Class {
	#name : #PRDocumentListNameSorter,
	#superclass : #PRDocumentListSorter,
	#category : #'Pillar-ExporterCore-Document-List'
}

{ #category : #initialization }
PRDocumentListNameSorter >> initialize [
	super initialize.
	files := OrderedCollection new.
	direction := 1
]

{ #category : #initialization }
PRDocumentListNameSorter >> sort [
	^ files sort: [ :a :b | 
		direction > 0 ifTrue: [a basename < b basename ]
		ifFalse: [a basename > b basename]]
]
