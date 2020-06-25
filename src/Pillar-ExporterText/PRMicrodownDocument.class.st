Class {
	#name : #PRMicrodownDocument,
	#superclass : #PRTextDocument,
	#category : #'Pillar-ExporterText'
}

{ #category : #accessing }
PRMicrodownDocument >> basicWriter [
	^ PRMicrodownWriter new
]

{ #category : #accessing }
PRMicrodownDocument >> extension [
	^ 'microdown'
]
