Class {
	#name : #PREnvironment,
	#superclass : #PRDocumentGroup,
	#instVars : [
		'name'
	],
	#category : #'Pillar-Model-Document'
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
	aVisitor visitColumns: self
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
