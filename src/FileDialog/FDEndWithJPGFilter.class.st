"
I'm selecting file finishing with .jpg
"
Class {
	#name : #FDEndWithJPGFilter,
	#superclass : #FDAbstractSimpleFilter,
	#category : #'FileDialog-filterStrategie'
}

{ #category : #accessing }
FDEndWithJPGFilter >> name [
	^ 'end with jpg'
]

{ #category : #accessing }
FDEndWithJPGFilter >> predicate: aFileReference [
	^ aFileReference basename
		regex: '.*\.jpg'
		matchesDo: [ :item | ^ true ]
]
