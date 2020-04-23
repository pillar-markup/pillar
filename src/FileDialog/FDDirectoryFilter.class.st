"
I'm selecting only directory
"
Class {
	#name : #FDDirectoryFilter,
	#superclass : #FDAbstractSimpleFilter,
	#category : #'FileDialog-filterStrategie'
}

{ #category : #accessing }
FDDirectoryFilter >> name [
	^ 'directory filter'
]

{ #category : #accessing }
FDDirectoryFilter >> predicate: aFileReference [
	^ aFileReference isDirectory
]
