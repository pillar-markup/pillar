"
I am an abstract class to describe a Phase of an export. 
A Phase takes an input, transforms it and returns an output.

A phase holds a configuration. This configuration is a  the configuration of the export.

To create a new phase you have to define its prority as a class method then to define the action of the Phase with a method actionOn: anInput. This method will return an output. 
You can also add some transformations to the output like: 

transformerInputFileOn: aCollection
	<pillarTransformer: 1> ""the parameter is the priority of the transformation""
	aCollection
		do: [ :each | 
			PRFileInclusion new
				configuration: self configuration;
				start: each ]
"
Class {
	#name : #PRPhase,
	#superclass : #PRObject,
	#instVars : [
		'configuration'
	],
	#category : #'Pillar-ExporterCore-Transformers'
}

{ #category : #'instance-creation' }
PRPhase class >> executeOn: aPillarContext [
	^ self new
		actionOn: aPillarContext
]

{ #category : #testing }
PRPhase class >> isAbstract [
	^ self = PRPhase
]

{ #category : #actions }
PRPhase >> actionOn: anInput [
	self subclassResponsibility
]

{ #category : #accessing }
PRPhase >> configuration [
	^ configuration ifNil: [ ConfigurationForPillar new ]
]

{ #category : #accessing }
PRPhase >> configuration: aConfiguration [
	configuration := aConfiguration
]

{ #category : #actions }
PRPhase >> executeOn: anInput [

	^ self actionOn: anInput
]

{ #category : #testing }
PRPhase >> isFileInclusionPhase [
	
	^ false
]

{ #category : #testing }
PRPhase >> isOutputFormatterPhase [
	
	^ false
]

{ #category : #testing }
PRPhase >> isParsingPhase [
	
	^ false
]

{ #category : #testing }
PRPhase >> isSavePhase [
	
	^ false
]

{ #category : #pipeline }
PRPhase >> prepareForExecutionOn: aPRProject [ 
	
	self subclassResponsibility
]
