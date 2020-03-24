Class {
	#name : #ClapPillarBuildCommandTest,
	#superclass : #TestCase,
	#category : #'Pillar-Tests-Cli'
}

{ #category : #adding }
ClapPillarBuildCommandTest >> testAddSubcommand [
	| allIds defaultCommand |
	defaultCommand := ClapPillarBuildCommand commandSpecification.
	allIds := PRTarget clapCommandList collect: [ :c | c identifier ].
	allIds do: 
		[ :id | 
			self assert: 
				(defaultCommand subcommands anySatisfy: 
					[ :c | c class = ClapCommand new class and: c identifier = id asSymbol]
			) 
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
	mainCommand := (PRProject on: FileSystem workingDirectory) defaultTarget buildClapCommand.
	self assert: (defaultCommand flags) asString = (mainCommand flags) asString
]
