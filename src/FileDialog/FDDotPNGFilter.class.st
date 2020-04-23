"
I'm selecting only PNG file
"
Class {
	#name : #FDDotPNGFilter,
	#superclass : #FDAbstractCompositeFilter,
	#category : #'FileDialog-filterStrategie'
}

{ #category : #accessing }
FDDotPNGFilter >> name [
	^ 'png filter'
]

{ #category : #accessing }
FDDotPNGFilter >> predicate: aFileReference [
	^ aFileReference isDirectory
		or: [ aFileReference isFile
				and: [ aFileReference basename
						regex: '.*\.png'
						matchesDo: [ :item | ^ true ].
					^ false ] ]
]
