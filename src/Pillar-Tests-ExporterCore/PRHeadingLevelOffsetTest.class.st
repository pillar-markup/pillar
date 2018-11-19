Class {
	#name : #PRHeadingLevelOffsetTest,
	#superclass : #PRNodeTransformerTest,
	#category : 'Pillar-Tests-ExporterCore-Transformers'
}

{ #category : #private }
PRHeadingLevelOffsetTest >> actualClass [
	^ PRHeadingLevelOffsetTransformer
]

{ #category : #tests }
PRHeadingLevelOffsetTest >> checkWithOffset: offset [
	| result input configuration |
	configuration := self configuration.
	configuration headingLevelOffset: offset.
	input := PRHeader new
		level: 3;
		add: (PRText content: 'a title');
		yourself.
	result := self executePhase: input with: configuration.
	self assert: result level equals: offset + 3
]

{ #category : #tests }
PRHeadingLevelOffsetTest >> testPositiveOffset [
	self checkWithOffset: 2
]

{ #category : #tests }
PRHeadingLevelOffsetTest >> testZeroOffset [
	self checkWithOffset: 0
]
