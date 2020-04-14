Class {
	#name : #PRInvalidTarget,
	#superclass : #PRErrorTarget,
	#category : #'Pillar-BookTester-CommandLine'
}

{ #category : #clap }
PRInvalidTarget class >> buildClapCommandWithId: anId withPositionals: isWithPositionals [
	^ self buildClapCommandWithId: anId withPositionals: isWithPositionals withDescription: 'Invalid export format. Please edit your pillar.conf with a valid format at "defaultExport" label'
]

{ #category : #accessing }
PRInvalidTarget class >> builderName [
	
	^ #errorInvalidTarget
]
