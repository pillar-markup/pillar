Class {
	#name : #PRInputDocument,
	#superclass : #Object,
	#instVars : [
		'project',
		'file'
	],
	#category : #'Pillar-ExporterCore-Base'
}

{ #category : #factory }
PRInputDocument class >> inputClassForFile: aFile [
	
	^ self subclasses
		detect: [ :each | each doesHandleExtension: aFile extension ]
		ifNone: [ PRNoInputDocument  ]
]

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
PRInputDocument >> forFile: aFileReference [
	
	self subclasses 
		detect: [ :each | each doesHandleExtension: aFileReference extension ] 
		ifNone: [ PRNoInputDocument ]
]

{ #category : #accessing }
PRInputDocument >> fullName [
	^ file fullName
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
