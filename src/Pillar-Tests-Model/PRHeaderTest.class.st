Class {
	#name : #PRHeaderTest,
	#superclass : #PRDocumentGroupTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRHeaderTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRHeaderTest >> actualClass [
	^ PRHeader
]

{ #category : #'tests-comparing' }
PRHeaderTest >> testEqualLevel [
	self deny: (self actualClass new level: 1) equals: (self actualClass new level: 2)
]

{ #category : #tests }
PRHeaderTest >> testIsHeader [
	self assert: self actualInstance isHeader
]

{ #category : #'tests-accessing' }
PRHeaderTest >> testName [
	self instance level: 3.
	self assert: self instance level equals: 3
]

{ #category : #'tests-instantiation' }
PRHeaderTest >> testWithAllLevel [
	instance := self actualClass withAll: self foobarInstances level: 3.
	self assert: self instance children size equals: 2.
	self assert: self instance children first equals: self fooInstance.
	self assert: self instance children second equals: self barInstance.
	self assert: self instance level equals: 3
]
