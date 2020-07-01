Class {
	#name : #PRDocumentGroupTest,
	#superclass : #PRDocumentItemTest,
	#category : #'Pillar-Tests-Core'
}

{ #category : #private }
PRDocumentGroupTest >> actualClass [
	^ PRDocumentGroup
]

{ #category : #'tests-adding' }
PRDocumentGroupTest >> testAdd [
	self instance add: self fooInstance.
	self assert: self instance children size equals: 1.
	self assert: self instance children first equals: self fooInstance.

	self instance add: self barInstance.
	self assert: self instance children size equals: 2.
	self assert: self instance children first equals: self fooInstance.
	self assert: self instance children second equals: self barInstance
]

{ #category : #'tests-adding' }
PRDocumentGroupTest >> testAddAll [
	self instance addAll: self foobarInstances.
	self assert: self instance children size equals: 2.
	self assert: self instance children first equals: self fooInstance.
	self assert: self instance children second equals: self barInstance
]

{ #category : #'tests-copying' }
PRDocumentGroupTest >> testCopyChildren [
	self instance addAll: self foobarInstances.
	self assert: self instance children equals: self instance copy children.
	self deny: self instance children identicalTo: self instance copy children.
	self instance children
		with: self instance copy children
		do: [ :a :b | 
			self assert: a equals: b.
			self deny: a identicalTo: b ]
]

{ #category : #'tests-testing' }
PRDocumentGroupTest >> testHasChildren [
	self deny: self instance hasChildren.
	self instance add: self fooInstance.
	self assert: self instance hasChildren
]

{ #category : #'tests-accessing' }
PRDocumentGroupTest >> testSize [
	self assert: self instance size equals: 0.
	self instance add: self fooInstance.
	self assert: self instance size equals: 1
]

{ #category : #'tests-accessing' }
PRDocumentGroupTest >> testText [
	self instance addAll: self foobarInstances.
	self assert: self instance text equals: 'foobar'
]

{ #category : #'tests-instantiation' }
PRDocumentGroupTest >> testWith [
	instance := self actualClass with: self fooInstance.
	self assert: instance children size equals: 1.
	self assert: instance children first equals: self fooInstance
]

{ #category : #'tests-instantiation' }
PRDocumentGroupTest >> testWithAll [
	instance := self actualClass withAll: self foobarInstances.
	self assert: instance children size equals: 2.
	self assert: instance children first equals: self fooInstance.
	self assert: instance children second equals: self barInstance
]
