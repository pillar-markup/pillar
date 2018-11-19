Class {
	#name : #PRCopyPhase,
	#superclass : #Object,
	#instVars : [
		'destinationDirectory',
		'sourceDirectory'
	],
	#category : 'Pillar-ExporterCore-Base'
}

{ #category : #'instance-creation' }
PRCopyPhase class >> directory: aString [ 
	
	^ self new
		directory: aString;
		yourself
]

{ #category : #accessing }
PRCopyPhase >> destinationDirectory [
	^ destinationDirectory
]

{ #category : #accessing }
PRCopyPhase >> destinationDirectory: anObject [
	destinationDirectory := anObject
]

{ #category : #executing }
PRCopyPhase >> executeOn: aPRCompilationContext [
	destinationDirectory exists
		ifTrue: [ ^ self ].
	destinationDirectory ensureCreateDirectory.
	sourceDirectory copyAllTo: destinationDirectory.
	^ self
]

{ #category : #accessing }
PRCopyPhase >> sourceDirectory [
	^ sourceDirectory
]

{ #category : #accessing }
PRCopyPhase >> sourceDirectory: anObject [
	sourceDirectory := anObject
]
