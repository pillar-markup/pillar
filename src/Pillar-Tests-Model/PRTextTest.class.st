Class {
	#name : #PRTextTest,
	#superclass : #PRDocumentItemTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRTextTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRTextTest >> actualClass [
	^ PRText
]

{ #category : #'tests-instantiation' }
PRTextTest >> testContent [
	instance := self actualClass content: 'zork'.
	self assert: self instance text equals: 'zork'
]

{ #category : #'tests-comparing' }
PRTextTest >> testEqualText [
	self deny: (self actualClass content: 'foo') equals: (self actualClass content: 'bar')
]

{ #category : #'tests-printing' }
PRTextTest >> testPrinting [
	| text |
	text := PRText content: 'abcdef'.
	'*abcdef*' match: text printString
]

{ #category : #'tests-accessing' }
PRTextTest >> testText [
	self instance text: 'zork'.
	self assert: self instance text equals: 'zork'
]
