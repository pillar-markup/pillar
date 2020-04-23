"
I'm selecting only jpg file
"
Class {
	#name : #FDDotJPGFilter,
	#superclass : #FDAbstractCompositeFilter,
	#category : #'FileDialog-filterStrategie'
}

{ #category : #accessing }
FDDotJPGFilter >> name [
	^ 'end with jpg'
]

{ #category : #accessing }
FDDotJPGFilter >> predicate: aFileReference [
	^ aFileReference isDirectory
		or: [ aFileReference isFile
				and: [ 
					aFileReference basename
						regex: '.*\.jpg'
						matchesDo: [ :item | ^ true ].
					^ false ] ]
]
