"
I'm a Mock needed in order to test PRTParametrizable
"
Class {
	#name : #PRMockForParameters,
	#superclass : #Object,
	#traits : 'PRTParametrizable',
	#classTraits : 'PRTParametrizable classTrait - {#parameterAt:IsIntegerIn:. #parameters:haveSize:}',
	#instVars : [
		'parameters'
	],
	#category : 'Pillar-Tests-Model-Core'
}

{ #category : #'accessing-parameters' }
PRMockForParameters >> parameters [
	^ parameters
]

{ #category : #accessing }
PRMockForParameters >> parameters: aCollection [
	parameters := aCollection
]
