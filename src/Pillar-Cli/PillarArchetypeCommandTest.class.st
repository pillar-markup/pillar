Class {
	#name : 'PillarArchetypeCommandTest',
	#superclass : 'TestCase',
	#instVars : [
		'context'
	],
	#category : 'Pillar-Cli',
	#package : 'Pillar-Cli'
}

{ #category : 'utils' }
PillarArchetypeCommandTest >> activatedCommandWith: args [

	^ (context arguments: args) 
]

{ #category : 'utils' }
PillarArchetypeCommandTest >> assertSuccess [

	self assert: context exitStatus equals: 0.
	self assert: self errorString isEmpty
]

{ #category : 'utils' }
PillarArchetypeCommandTest >> assertSuccess: 

	self assert: context [
]

{ #category : 'utils' }
PillarArchetypeCommandTest >> errorString [

	^ context stdio stderr contents utf8Decoded 
]

{ #category : 'utils' }
PillarArchetypeCommandTest >> outputReset [

	context stdio stdout resetContents
]

{ #category : 'utils' }
PillarArchetypeCommandTest >> outputString [

	^ context stdio stdout contents utf8Decoded 
]

{ #category : 'utils' }
PillarArchetypeCommandTest >> runCommand: args [

	^ (context arguments: args) execute
]

{ #category : 'running' }
PillarArchetypeCommandTest >> setUp [

	super setUp.
	context := ClapContext specification: ClapPillarArchetypeCommand commandSpecification
	
]

{ #category : 'running' }
PillarArchetypeCommandTest >> testExecuteCommandToPrintVersion [

	|  vrs |
	vrs := ClapPillarCommand pillarVersion.
	
	self assert: (context arguments: #( '--version' )) equals: vrs
]

{ #category : 'running' }
PillarArchetypeCommandTest >> testHasFlagList [

	
	| cmd |
	context arguments: #( 'archetype' '--list' ).
	cmd := context command.
	cmd hasFlag: #list	
]
