Class {
	#name : #PRMarkdownDocument,
	#superclass : #PRTextDocument,
	#category : #'Pillar-ExporterText'
}

{ #category : #accessing }
PRMarkdownDocument >> basicWriter [
	^ PRMarkdownWriter new
]

{ #category : #accessing }
PRMarkdownDocument >> extension [
	^ 'markdown'
]
