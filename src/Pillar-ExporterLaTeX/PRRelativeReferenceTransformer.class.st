Class {
	#name : #PRRelativeReferenceTransformer,
	#superclass : #Object,
	#instVars : [
		'inputFile',
		'baseDirectory',
		'outputDirectory'
	],
	#category : 'Pillar-ExporterLaTeX'
}

{ #category : #accessing }
PRRelativeReferenceTransformer >> baseDirectory [
	^ baseDirectory
]

{ #category : #accessing }
PRRelativeReferenceTransformer >> baseDirectory: anObject [
	baseDirectory := anObject
]

{ #category : #accessing }
PRRelativeReferenceTransformer >> destinationDirectoryFor: aDocument [ 
	
	| filePath relativePath |
	filePath := inputFile parent.
	relativePath := filePath relativeTo: baseDirectory.
	^ outputDirectory resolve: relativePath.
]

{ #category : #actions }
PRRelativeReferenceTransformer >> executeOn: aPRDocument [

	PRUpdateFileInclusionReference
		start: aPRDocument
		with: (self destinationDirectoryFor: aPRDocument) fullName.
	^ aPRDocument
]

{ #category : #accessing }
PRRelativeReferenceTransformer >> inputFile [
	^ inputFile
]

{ #category : #accessing }
PRRelativeReferenceTransformer >> inputFile: anObject [
	inputFile := anObject
]

{ #category : #accessing }
PRRelativeReferenceTransformer >> outputDirectory [
	^ outputDirectory
]

{ #category : #accessing }
PRRelativeReferenceTransformer >> outputDirectory: anObject [
	outputDirectory := anObject
]

{ #category : #execution }
PRRelativeReferenceTransformer >> start: aPRDocument [ 
	
	^ self executeOn: aPRDocument
]
