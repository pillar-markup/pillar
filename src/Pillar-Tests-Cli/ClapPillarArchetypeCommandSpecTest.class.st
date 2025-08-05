Class {
	#name : 'ClapPillarArchetypeCommandSpecTest',
	#superclass : 'TestCase',
	#category : 'Pillar-Tests-Cli-Clap',
	#package : 'Pillar-Tests-Cli',
	#tag : 'Clap'
}

{ #category : 'tests - archetype specification' }
ClapPillarArchetypeCommandSpecTest >> testArchetype [

	| context  |
	context := ClapPillarCommand commandSpecification activationWith: #(pillar archetype  'bod-book').
	self assert: context command requestedArchetype equals: 'bod-book'.
]

{ #category : 'tests - archetype specification' }
ClapPillarArchetypeCommandSpecTest >> testEmptyArchetype [

	| context  |
	context := ClapPillarCommand commandSpecification activationWith: #(pillar archetype).
	self should: [ context command requestedArchetype ] raise: NotFound.
]
