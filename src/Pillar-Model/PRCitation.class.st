"
I am a citation.
"
Class {
	#name : #PRCitation,
	#superclass : #PRDocumentItem,
	#traits : 'PRTParametrizable - {#parameterAt:put:. #hasParameters. #hasParameter:. #parameters}',
	#classTraits : 'PRTParametrizable classTrait',
	#instVars : [
		'parameters',
		'hadAllKeys',
		'ref'
	],
	#category : #'Pillar-Model-Document'
}

{ #category : #'as yet unclassified' }
PRCitation class >> defaultRef [
	^'No Reference'
]

{ #category : #'as yet unclassified' }
PRCitation class >> isAbstract [
	^false
]

{ #category : #'as yet unclassified' }
PRCitation class >> ref: aString [
	^ self new
		ref: aString;
		yourself
]

{ #category : #comparing }
PRCitation >> = anObject [
	^ super = anObject and: [ self ref = anObject ref ]
]

{ #category : #visiting }
PRCitation >> accept: aVisitor [
	^ aVisitor visitCitation: self
]

{ #category : #initialization }
PRCitation >> initialize [
	super initialize.
	ref := self class defaultRef
]

{ #category : #accessing }
PRCitation >> ref [
	^ ref
]

{ #category : #accessing }
PRCitation >> ref: aString [
	ref := aString
]
