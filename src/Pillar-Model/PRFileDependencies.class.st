"
I am a vistitor which visit the document and return all file dependencies of this document.
"
Class {
	#name : #PRFileDependencies,
	#superclass : #PRDependencies,
	#category : 'Pillar-Model-Visitor - Non Core'
}

{ #category : #testing }
PRFileDependencies class >> isAbstract [
	^ false
]

{ #category : #'visiting-document' }
PRFileDependencies >> visitInternalLink: anInternalLink [
	anInternalLink hasReference
		ifTrue: [ self cachedDependencies add: (anInternalLink localFileOrExternalReference) ].
	super visitInternalLink: anInternalLink 
]
