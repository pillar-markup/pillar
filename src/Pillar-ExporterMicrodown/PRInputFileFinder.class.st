"
I'm a visitor that returns all the `${inputFile:path=xxx}$` in a document. 
"
Class {
	#name : #PRInputFileFinder,
	#superclass : #PRVisitor,
	#instVars : [
		'metadata',
		'files'
	],
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #creation }
PRInputFileFinder class >> fromFileIndex: aFileReference [ 
	^ self new 
		fromFileIndex: aFileReference;
		yourself
]

{ #category : #accessing }
PRInputFileFinder >> files [
	^ files 
]

{ #category : #API }
PRInputFileFinder >> fromFileIndex: aFileReference [

	self start: (PRPillarParser parse: aFileReference contents)
	
]

{ #category : #accessing }
PRInputFileFinder >> initialize [

	super initialize.
	files := OrderedCollection new.
]

{ #category : #visiting }
PRInputFileFinder >> visitInputFileAnnotation: anInputFileAnnotation [

	files add: anInputFileAnnotation path
]
