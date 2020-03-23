Class {
	#name : #PRAbsentTarget,
	#superclass : #PRErrorTarget,
	#category : #'Pillar-BookTester-CommandLine'
}

{ #category : #clap }
PRAbsentTarget class >> buildClapCommandWithId: anId withPositionals: isWithPositionals [
	"When CLAP issue about ambiguous action with subcommand/positionnal will be solved, delete the withPositionals: isWithPositionals. We'll only use buildClapCommandWithId:"

	^ (ClapCommand id: anId asSymbol)
			description: 'Export format not found in pillar.config. Please edit it and add a valid export format at "defaultExport" label';
			add: ClapFlag forHelp;
			meaning: [ :args |
				args at: #helpFlag ifPresent: [ :help | help value; exitSuccess].
				(ClapDocumenter on: (ZnCharacterWriteStream on: args context stdout))
                explain: args specification.
				];
		yourself.
]

{ #category : #accessing }
PRAbsentTarget class >> builderName [
	
	^ #errorAbsentTarget
]
