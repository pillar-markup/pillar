Class {
	#name : #PRLinkTest,
	#superclass : #PRReferenceTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #private }
PRLinkTest >> actualClass [
	^ PRLink
]

{ #category : #private }
PRLinkTest >> markup [
	^ PRPillarParser markups at: PRLink
]

{ #category : #tests }
PRLinkTest >> testIsBroken [
	self assert: (self instance isBroken or: [ self instance isBroken not ])
]

{ #category : #tests }
PRLinkTest >> testIsExternal [
	self deny: self instance isExternal
]

{ #category : #tests }
PRLinkTest >> testIsInternal [
	self deny: self instance isInternal
]

{ #category : #tests }
PRLinkTest >> testIsLink [
	self assert: self instance isLink
]
