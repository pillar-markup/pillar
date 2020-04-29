Class {
	#name : #PRErrorTarget,
	#superclass : #PRTarget,
	#category : #'Pillar-ExporterCore-Base'
}

{ #category : #clap }
PRErrorTarget class >> buildClapCommandWithId: anId withPositionals: isWithPositionals withDescription: aDescription [

	^ (ClapCommand id: anId asSymbol)
			description: aDescription asString;
			add: ClapFlag forHelp;
			meaning: [ :args |
				args at: #helpFlag ifPresent: [ :help | help value; exitSuccess].
				(ClapDocumenter on: (ZnCharacterWriteStream on: args context stdout))
                explain: args specification.
				];
		yourself.
]

{ #category : #accessing }
PRErrorTarget class >> builderName [ 
	^ #errorTarget
]

{ #category : #testing }
PRErrorTarget class >> isAbstract [
	^ true
]
