"
I am a class use for sorting files according their modifications dates.
By default it is descending sorting.

PRDocListDateSorter with: aCollectionOfReferences
"
Class {
	#name : #PRDocumentListDateSorter,
	#superclass : #PRDocumentListSorter,
	#category : #'Pillar-ExporterCore-Document-List'
}

{ #category : #accessing }
PRDocumentListDateSorter >> initialize [
	super initialize.
	files := OrderedCollection new.
	direction := -1
]

{ #category : #sorting }
PRDocumentListDateSorter >> sort [
	^ files sort: [ :a :b | 
		direction < 0 ifTrue: [a modificationTime > b modificationTime ]
		ifFalse: [a modificationTime < b modificationTime]]
]
