"
i'm an Abstract class to 

my subclass must define:

isComposite : return Boolean

IV :

icon <Form> 
name <Form> 
"
Class {
	#name : #FDAbstractBookMark,
	#superclass : #Object,
	#instVars : [
		'name',
		'icon'
	],
	#category : #'FileDialog-bookMark'
}

{ #category : #accessing }
FDAbstractBookMark >> children [ 
	^ self subclassResponsibility
]

{ #category : #accessing }
FDAbstractBookMark >> icon [
	^ icon
]

{ #category : #accessing }
FDAbstractBookMark >> icon: anObject [
	icon := anObject
]

{ #category : #testing }
FDAbstractBookMark >> isComposite [
	^ self subclassResponsibility.
]

{ #category : #accessing }
FDAbstractBookMark >> name [
	^ name
]

{ #category : #accessing }
FDAbstractBookMark >> name: anObject [
	name := anObject
]
