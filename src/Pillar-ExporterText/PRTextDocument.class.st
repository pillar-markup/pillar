Class {
	#name : #PRTextDocument,
	#superclass : #PRAbstractOutputDocument,
	#category : 'Pillar-ExporterText'
}

{ #category : #accessing }
PRTextDocument >> basicWriter [
	
	^ PRTextWriter new
]

{ #category : #accessing }
PRTextDocument >> extension [
	
	^ 'txt'
]
