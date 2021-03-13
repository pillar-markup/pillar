Class {
	#name : #PRReferenceTest,
	#superclass : #PRDocumentGroupTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #private }
PRReferenceTest >> actualClass [
	^ PRReference
]

{ #category : #private }
PRReferenceTest >> markup [
	^ self subclassResponsibility
]

{ #category : #private }
PRReferenceTest >> referenceString [
	self subclassResponsibility
]

{ #category : #tests }
PRReferenceTest >> testAlias [
	self deny: self instance hasAlias.

	self instance add: self fooInstance.
	self assert: self instance hasAlias.
	self assert: self instance alias equals: 'foo'.

	self instance add: self barInstance.
	self assert: self instance hasAlias.
	self assert: self instance alias equals: 'foobar'
]

{ #category : #'tests-accessing' }
PRReferenceTest >> testAnchor [
	self deny: self instance hasAnchor
]

{ #category : #'tests-comparing' }
PRReferenceTest >> testEqualReference [
	self
		deny:
			(self actualClass new
				reference: 'foo';
				yourself)
		equals:
			(self actualClass new
				reference: 'bar';
				yourself)
]

{ #category : #'tests-parameters' }
PRReferenceTest >> testHasParameter [
	self instance parameters: (Dictionary with: 'foo' -> 'zork' with: 'bar' -> nil).
	self assert: (self instance hasParameter: 'foo').
	self assert: (self instance hasParameter: 'bar').
	self deny: (self instance hasParameter: 'zork')
]

{ #category : #'tests-parameters' }
PRReferenceTest >> testParameterAt [
	self instance parameters: (Dictionary with: 'foo' -> 'bar').
	self assert: (self instance parameters at: 'foo' ifAbsent: [ nil ]) equals: 'bar'.
	self assert: (self instance parameters at: 'bar' ifAbsent: [ nil ]) isNil
]

{ #category : #'tests-parameters' }
PRReferenceTest >> testParameterAtIfAbsent [
	self instance parameters: (Dictionary with: 'foo' -> 'bar').
	self assert: (self instance parameters at: 'foo' ifAbsent: [ 'zork' ]) equals: 'bar'.
	self assert: (self instance parameters at: 'bar' ifAbsent: [ 'zork' ]) equals: 'zork'
]

{ #category : #'tests-parameters' }
PRReferenceTest >> testParameterAtIfPresent [
	self instance parameters: (Dictionary with: 'foo' -> 'bar').
	self assert: (self instance parameters at: 'foo' ifPresent: [ :value | '!' , value ]) equals: '!bar'.
	self assert: (self instance parameters at: 'bar' ifPresent: [ :value | '!' , value ]) isNil
]

{ #category : #'tests-parameters' }
PRReferenceTest >> testParameterAtPut [
	self assert: (self instance parameters at: 'foo' put: 'bar') equals: 'bar'.
	self assert: self instance parameters size equals: 1.
	self assert: self instance parameters keys first equals: 'foo'.
	self assert: self instance parameters values first equals: 'bar'.

	self assert: (self instance parameters at: 'foo' put: 'zork') equals: 'zork'.
	self assert: self instance parameters size equals: 1.
	self assert: self instance parameters keys first equals: 'foo'.
	self assert: self instance parameters values first equals: 'zork'
]

{ #category : #'tests-parameters' }
PRReferenceTest >> testParameterCopy [
	| copy |
	self instance parameters at: 'class' put: 'active'.
	copy := self instance copy.
	copy parameters at: 'class' put: 'inactive'.
	copy parameters at: 'foo' put: 'bar'.

	self assert: (self instance parameters at: 'class') equals: 'active'.
	self deny: (self instance hasParameter: 'foo').

	self assert: (copy parameters at: 'class') equals: 'inactive'.
	self assert: (copy parameters at: 'foo') equals: 'bar'
]

{ #category : #'tests-parameters' }
PRReferenceTest >> testParameters [
	self assertEmpty: self instance parameters.
	self instance parameters: (Array with: 'foo' -> 'bar').
	self assert: self instance parameters size equals: 1
]

{ #category : #'tests-accessing' }
PRReferenceTest >> testReference [
	self instance reference: 'zork'.
	self assert: self instance reference equals: 'zork'
]

{ #category : #'tests-accessing' }
PRReferenceTest >> testTitle [
	self deny: self instance title isNotNil
]
