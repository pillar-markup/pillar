Class {
	#name : #PRAnchorTest,
	#superclass : #PRDocumentItemTest,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRAnchorTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRAnchorTest >> actualClass [
	^ PRAnchor
]

{ #category : #'tests-comparing' }
PRAnchorTest >> testEqualName [
	self deny: (self actualClass named: 'foo') equals: (self actualClass named: 'bar')
]

{ #category : #'tests-accessing' }
PRAnchorTest >> testName [
	self instance name: 'zork'.
	self assert: self instance name equals: 'zork'
]

{ #category : #'tests-parsing' }
PRAnchorTest >> testParseBasic [
	| wiki text tree |
	wiki := '@name'.
	text := ''.
	tree := PRDocument new
		add: (PRAnchor named: 'name');
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRAnchorTest >> testParseMultiple [
	| wiki text tree nLine|
	nLine := Smalltalk os lineEnding.
	wiki := '@one' , nLine , '@two' , nLine , nLine , '@tree'.
	text := ''.
	tree := PRDocument new
		add: (PRAnchor named: 'one');
		add: (PRAnchor named: 'two');
		add: PREmptyParagraph new;
		add: (PRAnchor named: 'tree');
		yourself.
	self 
		assertWiki: wiki
		equalsTree: tree.
	self 
		assertTree: tree
		equalsWiki: wiki.
	self 
		assertTree: tree
		equalsText: text
]

{ #category : #'tests-parsing' }
PRAnchorTest >> testParseSpaces [
	| wiki text tree |
	wiki := '@one two'.
	text := ''.
	tree := PRDocument new
		add: (PRAnchor named: 'one two');
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-instantiation' }
PRAnchorTest >> testWith [
	instance := self actualClass named: 'test'.
	self assert: self instance name equals: 'test'
]
