"
I am an abstract class of some that represents a link to a well known web site such as Wikipedia or Youtube.
"
Class {
	#name : #PRSemanticLink,
	#superclass : #PRExternalLink,
	#category : 'Pillar-Model-Document'
}

{ #category : #testing }
PRSemanticLink class >> isAbstract [
	^ true
]

{ #category : #testing }
PRSemanticLink class >> isValidReference: aString [

	| array |
	array := aString splitOn: ':'.
	^ array size > 1 & ((array at: 1) = self linkName)
]

{ #category : #accessing }
PRSemanticLink class >> linkName [
	self subclassResponsibility 
]

{ #category : #accessing }
PRSemanticLink class >> priority [
	^ 10
]
