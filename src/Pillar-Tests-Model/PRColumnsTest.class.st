Class {
	#name : 'PRColumnsTest',
	#superclass : 'PRDocumentGroupTest',
	#category : 'Pillar-Tests-Model-Document',
	#package : 'Pillar-Tests-Model',
	#tag : 'Document'
}

{ #category : 'testing' }
PRColumnsTest class >> isAbstract [
	^ false
]

{ #category : 'private' }
PRColumnsTest >> actualClass [
	^ PRColumnEnvironment
]
