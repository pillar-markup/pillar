"
A class for representing a gloabl sorter for different kind of sorting
"
Class {
	#name : #PRDocumentListSorter,
	#superclass : #Object,
	#instVars : [
		'direction',
		'files'
	],
	#category : 'Pillar-ExporterCore-Document-List'
}

{ #category : #'instance creation' }
PRDocumentListSorter class >> with: aCollection [
	^ self new
		files: aCollection;
		sort
]

{ #category : #'instance creation' }
PRDocumentListSorter class >> with: aCollection order: aString [
	^ self new
		files: aCollection;
		direction: aString;
		sort
]

{ #category : #accessing }
PRDocumentListSorter >> direction [
	^ direction
]

{ #category : #accessing }
PRDocumentListSorter >> files [
	^ files
]

{ #category : #accessing }
PRDocumentListSorter >> files: anObject [
	files := anObject
]

{ #category : #accessing }
PRDocumentListSorter >> sort [
	^ self subclassResponsibility 
]
