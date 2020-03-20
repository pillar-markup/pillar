Class {
	#name : #ClapPillarBuildCommandTest,
	#superclass : #TestCase,
	#category : #'Pillar-Tests-Cli'
}

{ #category : #adding }
ClapPillarBuildCommandTest >> testAddSubcommand [
	| allIds defaultCommand |
	defaultCommand := ClapPillarBuildCommand defaultCommand.
	allIds := PRTarget clapCommandList collect: [ :c | c identifier ].
	allIds do: [ :id |
		self assert: ((defaultCommand subcommands select: [ :c | c class = ClapCommand new class and: c identifier = id asSymbol ]) size = 1).
		 ]
]

{ #category : #tests }
ClapPillarBuildCommandTest >> testDefaultCommandIsBuild [
	| defaultCommand  |
	defaultCommand := ClapPillarBuildCommand defaultCommand.
	self assert: (defaultCommand identifier = #build)
]

{ #category : #tests }
ClapPillarBuildCommandTest >> testSameFlagsMainAndDefault [
	| defaultCommand mainCommand |
	defaultCommand := ClapPillarBuildCommand defaultCommand.
	mainCommand := PRTarget default buildClapCommand.
	self assert: (defaultCommand flags) asString = (mainCommand flags) asString
]
