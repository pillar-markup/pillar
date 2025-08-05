Class {
	#name : 'PRErrorTarget',
	#superclass : 'PRTarget',
	#category : 'Pillar-ExporterCore-Base',
	#package : 'Pillar-ExporterCore',
	#tag : 'Base'
}

{ #category : 'clap' }
PRErrorTarget class >> buildClapCommandWithId: anId withPositionals: isWithPositionals withDescription: aDescription [

	^ (ClapCommandSpec id: anId asSymbol)
			description: aDescription asString;
			addHelp;
			commandClass: self;
			meaning: [ :args |
				args at: #helpFlag ifPresent: [ :help | help value; exitSuccess].
				(ClapDocumenter on: (ZnCharacterWriteStream on: args context stdout))
                explain: args specification.
				];
		yourself.
]

{ #category : 'accessing' }
PRErrorTarget class >> builderName [ 
	^ #errorTarget
]

{ #category : 'testing' }
PRErrorTarget class >> isAbstract [
	^ true
]
