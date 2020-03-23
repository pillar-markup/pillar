Class {
	#name : #PRErrorTarget,
	#superclass : #PRTarget,
	#category : #'Pillar-ExporterCore-Base'
}

{ #category : #accessing }
PRErrorTarget class >> builderName [ 
	^ #errorTarget
]

{ #category : #testing }
PRErrorTarget class >> isAbstract [
	^ true
]
