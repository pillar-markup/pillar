"
I'm a root of objects that are Pillar objects but not visitable per se. 
I could be replaced by Object. 
"
Class {
	#name : #PRBasicObject,
	#superclass : #Object,
	#category : 'Pillar-Model-BasicRoots'
}

{ #category : #'error handling' }
PRBasicObject class >> defaultErrorClass [
	^ PRError
]
