"
I am an error announcing cyclic dependencies between pillar files.
"
Class {
	#name : #PRCyclicFileInclusionError,
	#superclass : #Error,
	#instVars : [
		'files'
	],
	#category : 'Pillar-ExporterCore-Export'
}

{ #category : #accessing }
PRCyclicFileInclusionError >> files: aCollection [ 
	files := aCollection
]
