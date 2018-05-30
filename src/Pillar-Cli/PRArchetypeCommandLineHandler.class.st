"
I am a command line handler to create a pillar project in the current directory.
The pillar project contains a basic template and skeleton pillar files following the archetype convention.

Example of usage:

./pillar archetype book
"
Class {
	#name : #PRArchetypeCommandLineHandler,
	#superclass : #PRSubCommandLineHandler,
	#category : 'Pillar-Cli-Handlers'
}

{ #category : #accessing }
PRArchetypeCommandLineHandler class >> commandName [
	^ 'archetype'
]

{ #category : #activation }
PRArchetypeCommandLineHandler >> activate [

	self project installArchetypeNamed: self requestedArchetype.
	self exitSuccess
]

{ #category : #activation }
PRArchetypeCommandLineHandler >> requestedArchetype [

	| nonOptions |
	self optionAt: 'template' ifPresent: [ :value | ^ value ].

	"also managed ./pillar archetype book (to be backward compatible)"
	nonOptions := self arguments reject: [ :a | a beginsWith: '-' ].
	^ nonOptions size = 1
		ifTrue: [ nonOptions last ]
		ifFalse: [ self errorMissingParameter: 'template' ].
]
