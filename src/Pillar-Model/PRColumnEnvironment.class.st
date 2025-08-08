"
I am a columns environment.
"
Class {
	#name : 'PRColumnEnvironment',
	#superclass : 'PRDocumentGroup',
	#category : 'Pillar-Model-Document',
	#package : 'Pillar-Model',
	#tag : 'Document'
}

{ #category : 'visiting' }
PRColumnEnvironment >> accept: aVisitor [
	^ aVisitor visitColumns: self
]
