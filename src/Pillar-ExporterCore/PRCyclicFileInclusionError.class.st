"
I am an error announcing cyclic dependencies between pillar files.
"
Class {
	#name : 'PRCyclicFileInclusionError',
	#superclass : 'Error',
	#instVars : [
		'files'
	],
	#category : 'Pillar-ExporterCore-Kept for doc ',
	#package : 'Pillar-ExporterCore',
	#tag : 'Kept for doc '
}

{ #category : 'accessing' }
PRCyclicFileInclusionError >> files: aCollection [ 
	files := aCollection
]
