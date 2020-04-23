Class {
	#name : #PRTextDocument,
	#superclass : #PRAbstractOutputDocument,
	#category : #'Pillar-ExporterText'
}

{ #category : #accessing }
PRTextDocument >> basicWriter [
	
	^ PRTextWriter new
]

{ #category : #accessing }
PRTextDocument >> extension [
	
	^ 'txt'
]

{ #category : #building }
PRTextDocument >> writeDocument: aDocument [

	| outputContent outputFile |
	outputContent := self basicWriter write: aDocument.
	
	
	self flag: #DuplicatedInSubclass.
	outputFile := (self outputDirectory resolve: (file file asAbsolute relativeTo: project baseDirectory asAbsolute)) withoutExtension , self extension.
	outputFile ensureDelete.
	outputFile parent ensureCreateDirectory.
	outputFile writeStreamDo: [ :stream | stream nextPutAll: outputContent ].
	^ outputFile
]
