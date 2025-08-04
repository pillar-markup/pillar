Class {
	#name : 'PRInvalidTarget',
	#superclass : 'PRErrorTarget',
	#category : 'Pillar-ExporterCore-Base',
	#package : 'Pillar-ExporterCore',
	#tag : 'Base'
}

{ #category : 'clap' }
PRInvalidTarget class >> buildClapCommandWithId: anId withPositionals: isWithPositionals [

	^ self 
		buildClapCommandWithId: anId 
		withPositionals: isWithPositionals withDescription: 'Invalid export format. Please edit your pillar.conf with a valid format at "defaultExport" label'
]

{ #category : 'accessing' }
PRInvalidTarget class >> builderName [
	
	^ #errorInvalidTarget
]
