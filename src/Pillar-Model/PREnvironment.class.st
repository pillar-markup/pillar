"
I represent an environment (as in LaTeX).
I'm a PRDocumentGroup with a name and a parameter list. 
Syntactically I'm delimited by a start and an end annotation. 
I can be nested inside other environment. 

${begin:card}$

!! I'm Cool

A paragraph about the card.
I will be interpreted as part of the card.

${end:card}$ 


"
Class {
	#name : #PREnvironment,
	#superclass : #PRDocumentGroup,
	#instVars : [
		'name'
	],
	#category : #'Pillar-Model-Minimal'
}

{ #category : #testing }
PREnvironment class >> isAbstract [
	^ false
]

{ #category : #'instance creation' }
PREnvironment class >> named: aString [ 
	
	^ self new name: aString; yourself
]

{ #category : #visiting }
PREnvironment >> accept: aVisitor [
	aVisitor visitEnvironment: self
]

{ #category : #accessing }
PREnvironment >> name [
	^ name
]

{ #category : #accessing }
PREnvironment >> name: aString [ 
	
	name := aString
]

{ #category : #visiting }
PREnvironment >> printOn: aStream [
	
	super printOn: aStream.
	aStream nextPut: $(; print: self name; nextPut: $)
]
