"
I'm responsible to represent the kind of input format is given to Pillar. 
In the past we got pillar and microdown but the registration was not explicit and relied on hacks

See MicInputDocument >> inputClassForFile: aFile

Once Pillar is removed we should revisit the architectural point. 
"
Class {
	#name : 'PRInputDocument',
	#superclass : 'Object',
	#instVars : [
		'project',
		'file'
	],
	#category : 'Pillar-ExporterCore-Base',
	#package : 'Pillar-ExporterCore',
	#tag : 'Base'
}

{ #category : 'factory' }
PRInputDocument class >> forFile: aFile [
	
	^ (self inputClassForFile: aFile) new file: aFile ; yourself
]

{ #category : 'factory' }
PRInputDocument class >> inputClassForFile: aFile [
	"In the future classes should register explicitely and not be based on subclasses or implementator tricks."
	
	
	"^ self subclasses
		detect: [ :each | each doesHandleExtension: aFile extension ]
		ifNone: [ PRNoInputDocument  ]
		
	before microdown integration we only looked in the subclasses of PRInputDocument. 
	Now MicInputDocument is not a subclass of PRInputDocument for dependency reasons.
	It could be fixed with proper packaging."
	
	
	^ ((SystemNavigation default allImplementorsOf: #doesHandleExtension:) 
		collect: [ :each | each methodClass instanceSide ]) 
		detect: [ :each | each doesHandleExtension: aFile extension ]
		ifNone: [ PRNoInputDocument  ]
]

{ #category : 'accessing' }
PRInputDocument >> basename [
	
	^ file basename
]

{ #category : 'building' }
PRInputDocument >> contributeToPipelineBuilding: aPRPipelineBuilder [ 
	
	1halt.
	self flag: #maybeToRemove.
	
	aPRPipelineBuilder setInputDocument: file.
	aPRPipelineBuilder parser: self parser
]

{ #category : 'accessing' }
PRInputDocument >> file [
	^ file
]

{ #category : 'accessing' }
PRInputDocument >> file: aFileReference [ 
	file := aFileReference
]

{ #category : 'accessing' }
PRInputDocument >> fullName [
	^ file fullName
]

{ #category : 'accessing' }
PRInputDocument >> path [
	
	^ file path
]

{ #category : 'printing' }
PRInputDocument >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPutAll: '(';
		nextPutAll: file fullName;
		nextPutAll: ')'
]

{ #category : 'accessing' }
PRInputDocument >> project [
	^ project
]

{ #category : 'accessing' }
PRInputDocument >> project: aPRProject [ 
	project := aPRProject
]
