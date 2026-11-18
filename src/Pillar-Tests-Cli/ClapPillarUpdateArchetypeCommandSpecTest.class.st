"
I test how the command line `pillar updateArchetype [name]` is read by `ClapPillarUpdateArchetypeCommand`, and that it replaced `pillar updateTemplate`.
"
Class {
	#name : 'ClapPillarUpdateArchetypeCommandSpecTest',
	#superclass : 'TestCase',
	#category : 'Pillar-Tests-Cli',
	#package : 'Pillar-Tests-Cli'
}

{ #category : 'tests' }
ClapPillarUpdateArchetypeCommandSpecTest >> testArchetypeName [

	| context |
	context := ClapPillarCommand commandSpecification activationWith:
		           #( pillar updateArchetype 'bod-book-latex2026' ).
	self
		assert: context command requestedArchetype
		equals: 'bod-book-latex2026'
]

{ #category : 'tests' }
ClapPillarUpdateArchetypeCommandSpecTest >> testNoArchetypeNameMeansTheInstalledOne [

	| context |
	context := ClapPillarCommand commandSpecification activationWith:
		           #( pillar updateArchetype ).
	self assert: context command requestedArchetype isEmpty
]

{ #category : 'tests' }
ClapPillarUpdateArchetypeCommandSpecTest >> testUpdateTemplateIsGone [

	self deny:
		(ClapPillarCommand commandSpecification subcommands anySatisfy: [
			 :each | each identifier = #updateTemplate ]).
	self assert:
		(ClapPillarCommand commandSpecification subcommands anySatisfy: [
			 :each | each identifier = #updateArchetype ])
]
