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

{ #category : #building }
PRMarkdownDocument >> writeDocument: aDocument [

	| outputContent outputFile |
	outputContent := self basicWriter write: aDocument.
	
	
	self flag: #DuplicatedInSubclass.
	outputFile := (self outputDirectory resolve: (file file asAbsolute relativeTo: project baseDirectory asAbsolute)) withoutExtension , self extension.
	outputFile ensureDelete.
	outputFile parent ensureCreateDirectory.
	outputFile writeStreamDo: [ :stream | stream nextPutAll: outputContent ].
	^ outputFile
]
