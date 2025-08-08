Class {
	#name : 'PRColumnTest',
	#superclass : 'PRDocumentGroupTest',
	#category : 'Pillar-Tests-Model-Document',
	#package : 'Pillar-Tests-Model',
	#tag : 'Document'
}

{ #category : 'testing' }
PRColumnTest class >> isAbstract [
	^ false
]

{ #category : 'private' }
PRColumnTest >> actualClass [
	^ PRColumn
]
