Class {
	#name : #PRInvalidTarget,
	#superclass : #PRErrorTarget,
	#category : #'Pillar-BookTester-CommandLine'
}

{ #category : #clap }
PRInvalidTarget class >> buildClapCommandWithId: anId withPositionals: isWithPositionals [

	^ (ClapCommand id: anId asSymbol)
			description: 'Invalid export format. Please edit your pillar.conf with a valid format at "defaultExport" label';
			add: ClapFlag forHelp;
			meaning: [ :args |
				args at: #helpFlag ifPresent: [ :help | help value; exitSuccess].
				(ClapDocumenter on: (ZnCharacterWriteStream on: args context stdout))
                explain: args specification.
				];
		yourself.
]

{ #category : #accessing }
PRInvalidTarget class >> builderName [
	
	^ #errorInvalidTarget
]
