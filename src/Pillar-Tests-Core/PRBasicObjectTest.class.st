Class {
	#name : #PRBasicObjectTest,
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'instance'
	],
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRBasicObjectTest class >> isAbstract [
	^ true
]

{ #category : #accessing }
PRBasicObjectTest class >> packageNamesUnderTest [
	^ #('Pillar-Model')
]

{ #category : #testing }
PRBasicObjectTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #private }
PRBasicObjectTest >> actualClass [
	^ PRObject
]

{ #category : #private }
PRBasicObjectTest >> actualInstance [
	^ self actualClass new
]

{ #category : #accessing }
PRBasicObjectTest >> instance [
	^ instance
]

{ #category : #tests }
PRBasicObjectTest >> lineEnding [

	^ Smalltalk os lineEnding
]

{ #category : #running }
PRBasicObjectTest >> setUp [
	super setUp.
	instance := self actualInstance
]
