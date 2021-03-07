Class {
	#name : #PRDocumentTest,
	#superclass : #PRDocumentGroupTest,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRDocumentTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRDocumentTest >> actualClass [
	^ PRDocument
]

{ #category : #tests }
PRDocumentTest >> testTitle [
	| tree |
	tree := PRDocument new
		propertyAt: 'title' put: 'Atom heart mother';
		yourself.
	self assert: tree title equals: 'Atom heart mother'.
	tree := PRDocument new
		add:
			(PRHeader new
				level: 1;
				add: (PRText content: 'Echoes');
				yourself).
	self assert: tree title equals: 'Echoes'.
	self assert: PRDocument new title equals: 'No title'
]
