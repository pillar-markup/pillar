Class {
	#name : #PRAnchorTest,
	#superclass : #PRDocumentItemTest,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRAnchorTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRAnchorTest >> actualClass [
	^ PRAnchor
]

{ #category : #'tests-comparing' }
PRAnchorTest >> testEqualName [
	self deny: (self actualClass named: 'foo') equals: (self actualClass named: 'bar')
]

{ #category : #'tests-accessing' }
PRAnchorTest >> testName [
	self instance name: 'zork'.
	self assert: self instance name equals: 'zork'
]

{ #category : #'tests-instantiation' }
PRAnchorTest >> testWith [
	instance := self actualClass named: 'test'.
	self assert: self instance name equals: 'test'
]
