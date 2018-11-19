Class {
	#name : #PRSemanticLinkTest,
	#superclass : #PRExternalLinkTest,
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRSemanticLinkTest class >> isAbstract [
	^ true
]

{ #category : #private }
PRSemanticLinkTest >> expectedUrlForReferenceString [
	self subclassResponsibility 
]

{ #category : #private }
PRSemanticLinkTest >> expectedUrlForSimpleReferenceString [
	self subclassResponsibility 
]

{ #category : #private }
PRSemanticLinkTest >> referenceString [
	self subclassResponsibility 
]

{ #category : #private }
PRSemanticLinkTest >> simpleReferenceString [
	self subclassResponsibility 
]

{ #category : #tests }
PRSemanticLinkTest >> testLinkToAFigureIsExternalLink [
	self expectedFailures
]

{ #category : #tests }
PRSemanticLinkTest >> testTitle [
	self instance reference: self referenceString.
	self assert: self instance title equals: self referenceString
]

{ #category : #tests }
PRSemanticLinkTest >> testUrl [
	self instance reference: self referenceString.
	self assert: self instance url equals: self expectedUrlForReferenceString.
	
	self instance reference: self simpleReferenceString.
	self assert: self instance url equals: self expectedUrlForSimpleReferenceString
]
