"
I am an error announcing cyclic dependencies between pillar files.
"
Class {
	#name : #PRCyclicFileInclusionError,
	#superclass : #Error,
	#instVars : [
		'files'
	],
	#category : #'Pillar-ExporterCore-Transformers'
}

{ #category : #accessing }
PRCyclicFileInclusionError >> files: aCollection [ 
	files := aCollection
]
