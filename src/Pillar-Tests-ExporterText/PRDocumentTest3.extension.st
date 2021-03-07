Extension { #name : #PRDocumentTest3 }

{ #category : #'*pillar-tests-exportertext' }
PRDocumentTest3 >> testTitle [
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
