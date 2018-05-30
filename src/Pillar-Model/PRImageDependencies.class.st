"
I am a vistitor which visit the document and return all image dependencies of this document.
"
Class {
	#name : #PRImageDependencies,
	#superclass : #PRDependencies,
	#category : 'Pillar-Model-Visitor - Non Core'
}

{ #category : #'as yet unclassified' }
PRImageDependencies class >> isAbstract [
	^ false
]

{ #category : #'visiting-document' }
PRImageDependencies >> visitFigure: anObject [ 
	cachedDependencies add: anObject localFileOrExternalReference.
	super visitFigure: anObject.
]
