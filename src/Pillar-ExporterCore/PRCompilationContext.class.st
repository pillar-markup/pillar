"
S. Ducasse comment: 

It looks like this class is actually doing nothing since it just stores two values and returns value. Most of the time people write

(PRCompilationContext 
	withDocument: anInput
	withConfiguration: 'ljkjlkjkl') input
	
(PRCompilationContext 
	withDocument: 'jkljlkj'
	withConfiguration: 'ljkjlkjkl') input

But PRCheckPhase uses the configuration passed bt the context. 

executeOn: aPillarContext
	self new
		configuration: aPillarContext configuration;
		start: aPillarContext input.
	^ aPillarContext
	

"
Class {
	#name : #PRCompilationContext,
	#superclass : #PRObject,
	#instVars : [
		'configuration',
		'input'
	],
	#category : #'Pillar-ExporterCore-Transformers'
}

{ #category : #'instance creation' }
PRCompilationContext class >> configuration: aConfiguration [
	^ self new configuration: aConfiguration
]

{ #category : #'instance creation' }
PRCompilationContext class >> isAbstract [
	^ false
]

{ #category : #'instance creation' }
PRCompilationContext class >> withDocument: aDocument withConfiguration: aConfiguration [
	^ self new
		input: aDocument;
		configuration: aConfiguration;
		yourself
]

{ #category : #accessing }
PRCompilationContext >> configuration [
	^ configuration
]

{ #category : #accessing }
PRCompilationContext >> configuration: aConfiguration [
	configuration := aConfiguration
]

{ #category : #accessing }
PRCompilationContext >> input [
	^ input
]

{ #category : #accessing }
PRCompilationContext >> input: anObject [
	input := anObject
]
