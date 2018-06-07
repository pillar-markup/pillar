"
In flux, right now there is no user of this class.
"
Class {
	#name : #PRPlugin,
	#superclass : #Object,
	#instVars : [
		'pluginName'
	],
	#category : 'Pillar-Project-Core'
}

{ #category : #'instance-creation' }
PRPlugin class >> on: aPluginName [ 
	
	^ self new
		pluginName: aPluginName;
		yourself
]

{ #category : #accessing }
PRPlugin >> pluginName: aString [ 
	pluginName := aString
]

{ #category : #preparation }
PRPlugin >> prepareForExecutionOn: aPRProject [ 
	self shouldBeImplemented.
]
