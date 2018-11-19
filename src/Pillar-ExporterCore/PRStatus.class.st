Class {
	#name : #PRStatus,
	#superclass : #Object,
	#category : 'Pillar-ExporterCore-Base'
}

{ #category : #'instance creation' }
PRStatus class >> withStatus: aBoolean [


	^ aBoolean 
		ifTrue: [ PRSuccess new ]
		ifFalse: [ PRFailure new ]
]

{ #category : #controlling }
PRStatus >> and: aPRStatus [

	self subclassResponsibility
]

{ #category : #controlling }
PRStatus >> exitProcess [

	self subclassResponsibility
]

{ #category : #controlling }
PRStatus >> isFailure [

	self subclassResponsibility 
]

{ #category : #controlling }
PRStatus >> isSuccess [

	self subclassResponsibility 
]

{ #category : #controlling }
PRStatus >> value [

	self subclassResponsibility
	

]
