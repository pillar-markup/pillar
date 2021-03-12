Class {
	#name : #PRRawTest,
	#superclass : #PRTextTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #private }
PRRawTest >> actualClass [
	^ PRRaw
]

{ #category : #'tests-accessing' }
PRRawTest >> testType [
	self instance type: 'html'.
	self assert: self instance type equals: 'html'
]
