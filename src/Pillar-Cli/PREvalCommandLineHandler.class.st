Class {
	#name : #PREvalCommandLineHandler,
	#superclass : #PRSubCommandLineHandler,
	#category : #'Pillar-Cli-Handlers'
}

{ #category : #accessing }
PREvalCommandLineHandler class >> commandName [
	^ 'eval'
]

{ #category : #activation }
PREvalCommandLineHandler >> activate [

	| nonOptions |
	nonOptions := self arguments reject: [ :a | a beginsWith: '-' ].
	nonOptions do: [ :each | OpalCompiler evaluate: each ].
]
