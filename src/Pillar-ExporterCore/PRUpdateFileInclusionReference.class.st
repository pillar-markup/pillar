"
I update all reference of figures and internal links for file inclusion 
"
Class {
	#name : #PRUpdateFileInclusionReference,
	#superclass : #PRVisitor,
	#instVars : [
		'path'
	],
	#category : 'Pillar-ExporterCore-Utilities'
}

{ #category : #visiting }
PRUpdateFileInclusionReference class >> isAbstract [
	^ false
]

{ #category : #visiting }
PRUpdateFileInclusionReference class >> start: aDocument with: aPath [
	^ self new
		path: aPath;
		start: aDocument
]

{ #category : #'instance creation' }
PRUpdateFileInclusionReference >> newReferenceFor: aReference [
	(aReference reference includesSubstring: 'file://')
		ifTrue: [ ^ aReference reference copyReplaceAll: 'file://' with: 'file://', self path , '/' ].

	^ self path
		ifEmpty: [ aReference reference ]	
		ifNotEmpty: [ self path , '/' , aReference reference]
]

{ #category : #accessing }
PRUpdateFileInclusionReference >> path [
	^ path
]

{ #category : #accessing }
PRUpdateFileInclusionReference >> path: aPath [
	path := aPath
]

{ #category : #visiting }
PRUpdateFileInclusionReference >> start: anObject [
	super start: anObject.
	^ anObject
]

{ #category : #visiting }
PRUpdateFileInclusionReference >> visitFigure: aFigure [
	aFigure reference: (self newReferenceFor: aFigure).
	super visitFigure: aFigure
]

{ #category : #visiting }
PRUpdateFileInclusionReference >> visitInternalLink: anInternalLink [
	anInternalLink hasReference  
		ifTrue: [ anInternalLink reference: (self newReferenceFor: anInternalLink) ].
	super visitInternalLink: anInternalLink
]
