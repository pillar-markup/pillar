Class {
	#name : #PRSuccess,
	#superclass : #PRStatus,
	#category : 'Pillar-ExporterCore-Base'
}

{ #category : #controlling }
PRSuccess >> and: aPRStatus [

	^ aPRStatus
]

{ #category : #controlling }
PRSuccess >> exitProcess [

	Exit signalSuccess
]

{ #category : #controlling }
PRSuccess >> isFailure [

	^ false
]

{ #category : #controlling }
PRSuccess >> isSuccess [

	^ true
]

{ #category : #controlling }
PRSuccess >> value [
	
	^ 0
]
