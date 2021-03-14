Class {
	#name : #PRHorizontalRuleTest,
	#superclass : #PRDocumentItemTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRHorizontalRuleTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRHorizontalRuleTest >> actualClass [
	^ PRHorizontalRule
]

{ #category : #private }
PRHorizontalRuleTest >> textString [
	^ String new: 40 withAll: $-
]
