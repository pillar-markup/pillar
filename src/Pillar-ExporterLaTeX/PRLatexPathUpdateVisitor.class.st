"
I am a pillar visitor that updates all references to be latex compatible. I am particularly useful in windows platforms that use the \ delimiter, which is not correctly parsed by the latex compiler.

Latex Paths have to use the / delimiter, even in windows. The following are examples of correct paths:

/usr/lib/bla

C:/Program Files/Something
"
Class {
	#name : #PRLatexPathUpdateVisitor,
	#superclass : #PRNodeTransformer,
	#category : #'Pillar-ExporterLaTeX'
}

{ #category : #visiting }
PRLatexPathUpdateVisitor class >> isAbstract [
	^ false
]

{ #category : #visiting }
PRLatexPathUpdateVisitor class >> key [

	^ #latexPathUpdate
]

{ #category : #visiting }
PRLatexPathUpdateVisitor class >> start: aDocument [
	^ self new start: aDocument
]

{ #category : #'instance creation' }
PRLatexPathUpdateVisitor >> newReferenceFor: aReference [
	
	^ aReference reference copyReplaceAll: '\' with: '/'
]

{ #category : #visiting }
PRLatexPathUpdateVisitor >> visitFigure: aFigure [
	aFigure reference: (self newReferenceFor: aFigure).
	super visitFigure: aFigure
]

{ #category : #visiting }
PRLatexPathUpdateVisitor >> visitInternalLink: anInternalLink [
	anInternalLink hasReference  
		ifTrue: [ anInternalLink reference: (self newReferenceFor: anInternalLink) ].
	super visitInternalLink: anInternalLink
]
