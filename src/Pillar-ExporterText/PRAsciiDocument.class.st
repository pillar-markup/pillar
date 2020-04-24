Class {
	#name : #PRAsciiDocument,
	#superclass : #PRTextDocument,
	#category : #'Pillar-ExporterText'
}

{ #category : #accessing }
PRAsciiDocument >> basicWriter [
	^ PRAsciiDocWriter new
]

{ #category : #accessing }
PRAsciiDocument >> extension [
	^ 'ascii'
]
