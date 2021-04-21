Class {
	#name : #PRInternalLinkTest,
	#superclass : #PRLinkTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRInternalLinkTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRInternalLinkTest >> actualClass [
	^ PRInternalLink
]

{ #category : #private }
PRInternalLinkTest >> referenceString [
	^ 'Page'
]

{ #category : #'tests-accessing' }
PRInternalLinkTest >> testAnchor [
	self instance anchor: 'zork'.
	self assert: self instance anchor equals: 'zork'.
	self assert: self instance hasAnchor
]

{ #category : #'tests-comparing' }
PRInternalLinkTest >> testEqualAnchor [
	self
		deny:
			(self actualClass new
				anchor: 'foo';
				yourself)
		equals:
			(self actualClass new
				anchor: 'bar';
				yourself)
]

{ #category : #tests }
PRInternalLinkTest >> testIsInternal [
	self assert: self instance isInternal
]

{ #category : #'tests-accessing' }
PRInternalLinkTest >> testTitle [
	super testTitle.
	self instance reference: 'page'.
	self assert: self instance title equals: 'page'
]
