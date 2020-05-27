Class {
	#name : #PRAbsentTarget,
	#superclass : #PRErrorTarget,
	#category : #'Pillar-ExporterCore-Base'
}

{ #category : #clap }
PRAbsentTarget class >> buildClapCommandWithId: anId withPositionals: isWithPositionals [
	^ self 
		buildClapCommandWithId: anId 
		withPositionals: isWithPositionals 
		withDescription: 'Export format not found in pillar.config. Please edit it and add a valid export format at "defaultExport" label'

]

{ #category : #accessing }
PRAbsentTarget class >> builderName [
	
	^ #errorAbsentTarget
]
