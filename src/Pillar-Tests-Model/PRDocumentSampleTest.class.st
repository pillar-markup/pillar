Class {
	#name : #PRDocumentSampleTest,
	#superclass : #TestCase,
	#category : #'Pillar-Tests-Model-Core'
}

{ #category : #tests }
PRDocumentSampleTest >> testHeaderLevel1Exist [

	| sample |
	sample := PRDocumentSample new headerLevel1.
	self assert: sample hasChildren.
]
