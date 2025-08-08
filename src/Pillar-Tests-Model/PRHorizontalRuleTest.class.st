Class {
	#name : 'PRHorizontalRuleTest',
	#superclass : 'PRDocumentItemTest',
	#category : 'Pillar-Tests-Model-Document',
	#package : 'Pillar-Tests-Model',
	#tag : 'Document'
}

{ #category : 'testing' }
PRHorizontalRuleTest class >> isAbstract [
	^ false
]

{ #category : 'private' }
PRHorizontalRuleTest >> actualClass [
	^ PRHorizontalRule
]

{ #category : 'private' }
PRHorizontalRuleTest >> textString [
	^ String new: 40 withAll: $-
]
