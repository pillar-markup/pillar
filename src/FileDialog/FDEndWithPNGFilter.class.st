"
I'm selecting file finishing with .png
"
Class {
	#name : #FDEndWithPNGFilter,
	#superclass : #FDAbstractSimpleFilter,
	#category : #'FileDialog-filterStrategie'
}

{ #category : #accessing }
FDEndWithPNGFilter >> name [
	^ 'end with png'
]

{ #category : #accessing }
FDEndWithPNGFilter >> predicate: aFileReference [
	^ aFileReference basename
		regex: '.*\.png'
		matchesDo: [ :item | ^ true ]
]
