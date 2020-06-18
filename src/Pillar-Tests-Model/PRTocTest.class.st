"
Test hash properties
"
Class {
	#name : #PRTocTest,
	#superclass : #PRDocumentItemTest,
	#category : #'Pillar-Tests-Model-Toc'
}

{ #category : #testing }
PRTocTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRTocTest >> actualClass [
	^ PRToc
]

{ #category : #tests }
PRTocTest >> testDifferentTocsHaveDifferentHashValue [
	| toc1 toc2 |
	toc1 := PRToc new
		name: 'test5';
		level: 1;
		addChildren:
			(PRToc new
				name: 'test2';
				level: 2).
	toc2 := PRToc new
		name: 'test1';
		level: 1;
		addChildren:
			(PRToc new
				name: 'test2';
				level: 2).
	self deny: toc1 equals: toc2.
	self deny: toc1 hash equals: toc2 hash
]

{ #category : #tests }
PRTocTest >> testSameTocsHaveSameHashValue [
	| toc1 toc2 |
	toc1 := PRToc new
		name: 'test1';
		level: 1;
		addChildren:
			(PRToc new
				name: 'test2';
				level: 2).
	toc2 := PRToc new
		name: 'test1';
		level: 1;
		addChildren:
			(PRToc new
				name: 'test2';
				level: 2).
	self assert: toc1 equals: toc2.
	self assert: toc1 hash equals: toc2 hash
]
