Class {
	#name : #PRFailure,
	#superclass : #PRStatus,
	#category : 'Pillar-ExporterCore-Base'
}

{ #category : #controlling }
PRFailure >> and: aPRStatus [
	
	^ self
]

{ #category : #controlling }
PRFailure >> exitProcess [

	Exit signalFailure
]

{ #category : #controlling }
PRFailure >> isFailure [

	^ true
]

{ #category : #controlling }
PRFailure >> isSuccess [

	^ false
]

{ #category : #controlling }
PRFailure >> value [

	^ 1
]
