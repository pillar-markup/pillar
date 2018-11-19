Class {
	#name : #PRInputDocument,
	#superclass : #Object,
	#instVars : [
		'project',
		'file'
	],
	#category : 'Pillar-ExporterCore-Base'
}

{ #category : #accessing }
PRInputDocument >> basename [
	
	^ file basename
]

{ #category : #building }
PRInputDocument >> contributeToPipelineBuilding: aPRPipelineBuilder [ 
	
	1halt.
	self flag: #maybeToRemove.
	
	aPRPipelineBuilder setInputDocument: file.
	aPRPipelineBuilder parser: self parser
]

{ #category : #accessing }
PRInputDocument >> file [
	^ file
]

{ #category : #accessing }
PRInputDocument >> file: aFileReference [ 
	file := aFileReference
]

{ #category : #accessing }
PRInputDocument >> fullName [
	^ file fullName
]

{ #category : #accessing }
PRInputDocument >> parser [
	
	file extension = 'pillar'
		ifTrue: [ ^ PRDocument parser ].
	self error: 'No parser for document extension: ', file extension
]

{ #category : #accessing }
PRInputDocument >> path [
	
	^ file path
]

{ #category : #printing }
PRInputDocument >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPutAll: '(';
		nextPutAll: file fullName;
		nextPutAll: ')'
]

{ #category : #accessing }
PRInputDocument >> project [
	^ project
]

{ #category : #accessing }
PRInputDocument >> project: aPRProject [ 
	project := aPRProject
]
