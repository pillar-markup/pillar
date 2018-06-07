Class {
	#name : #PRPillarVersion,
	#superclass : #Object,
	#category : 'Pillar-Cli-PillarVersion'
}

{ #category : #accessing }
PRPillarVersion class >> current [ 

	^ self new 
]

{ #category : #printing }
PRPillarVersion >> printOn: aStream [
	aStream nextPutAll: self versionString
]

{ #category : #printing }
PRPillarVersion >> versionString [
	^ ConfigurationOfPillar project stableVersion versionNumber
]
