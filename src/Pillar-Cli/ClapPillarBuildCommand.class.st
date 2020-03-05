Class {
	#name : #ClapPillarBuildCommand,
	#superclass : #Object,
	#category : #'Pillar-Cli'
}

{ #category : #'as yet unclassified' }
ClapPillarBuildCommand class >> commandSpecification [
	<commandline>
	^ (ClapCommand withName: #build)
		add: (ClapPositional withName: #requestedBuilder);
		add: ((ClapPositional withName: #requestedFiles )
			multiple: true);
		meaning: [ :commandMatch |
			| out |
			out := commandMatch context stdout.
			(1 to: 12)
			do: [ :each | out >> each asString ]
			separatedBy: [ out space ].
			out newLine ]
]
