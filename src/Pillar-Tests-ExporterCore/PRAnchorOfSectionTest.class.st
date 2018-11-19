Class {
	#name : #PRAnchorOfSectionTest,
	#superclass : #PRNodeTransformerTest,
	#category : 'Pillar-Tests-ExporterCore-Transformers'
}

{ #category : #private }
PRAnchorOfSectionTest >> actualClass [
	^ PRAnchorOfSection
]

{ #category : #tests }
PRAnchorOfSectionTest >> testAnchorWithSimpleTitle [

	| input expected config |
	config := self configuration.
	config printer level2 autoAnchor: true. 
	

	input := PRDocument new
		add: (PRHeader new level: 2; add: (PRText content: 'foo'));
		yourself.
	expected := PRDocument new
		add: (PRHeader new level: 2; add: (PRText content: 'foo'));
		add: (PRAnchor named: 'foo@1');
		yourself.
	self assert: (self executePhase: input with: config) equals: expected
]

{ #category : #tests }
PRAnchorOfSectionTest >> testAnchorWithSimpleTitleAndAnchorNumberName [
	| input expected config |
	config := self configuration.
	config printer level2 autoAnchor: true. 
	input := PRDocument new
		add:
				(PRHeader new	level: 2;
						add: (PRText content: '42'));
						add: (PRAnchor named: '42') yourself..
	
	expected := PRDocument new
		add:
				(PRHeader new
						level: 2;
						add: (PRText content: '42'));
		add: (PRAnchor named: '42@1');
		add: (PRAnchor named: '42') yourself.
	self assert: (self executePhase: input with: config) equals: expected
]

{ #category : #tests }
PRAnchorOfSectionTest >> testAnchorWithSimpleTitleAndAnchorWithSameName [
	| input expected config |
	config := self configuration.
	config printer level2 autoAnchor: true. 
	
	input := PRDocument new
		add:
				(PRHeader new	level: 2;
						add: (PRText content: 'foo'));
						add: (PRAnchor named: 'foo@41') yourself.
	
	expected := PRDocument new
		add:
				(PRHeader new
						level: 2;
						add: (PRText content: 'foo'));
		add: (PRAnchor named: 'foo@42');
		add: (PRAnchor named: 'foo@41') yourself.
	self assert: (self executePhase: input with: config) equals: expected
]

{ #category : #tests }
PRAnchorOfSectionTest >> testAnchorWithTwoSameTitle [
	| input expected config |
	config := self configuration.
	config printer level2 autoAnchor: true. 
	
	input := PRDocument new
		add: (PRHeader new	level: 2; add: (PRText content: 'foo'));
		add: (PRHeader new	level: 2; add: (PRText content: 'foo'));
		yourself.
	expected := PRDocument new
		add: (PRHeader new level: 2; add: (PRText content: 'foo'));
		add: (PRAnchor named: 'foo@1');
		add: (PRHeader new level: 2; add: (PRText content: 'foo'));
		add: (PRAnchor named: 'foo@2') yourself.
	self assert: (self executePhase: input with: config) equals: expected
]

{ #category : #tests }
PRAnchorOfSectionTest >> testAnchorWithoutTitle [
	| input config |
	config := self configuration.
	input := PRDocument new
		add: (PRText content: 'foo');
		yourself.
	self assert: (self executePhase: input with: config) equals: input
]
