Class {
	#name : #PRExternalLinkTest,
	#superclass : #PRLinkTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRExternalLinkTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRExternalLinkTest >> actualClass [
	^ PRExternalLink
]

{ #category : #private }
PRExternalLinkTest >> referenceString [
	^ 'http://www.lukas-renggli.ch'
]

{ #category : #tests }
PRExternalLinkTest >> testIsExternal [
	self assert: self instance isExternal
]

{ #category : #tests }
PRExternalLinkTest >> testLinkToAFigureIsExternalLink [
	| wiki text tree |
	wiki := '*file://foo.png*'.
	text := self actualClass new
		reference: 'file://foo.png';
		title.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				reference: 'file://foo.png';
				yourself);
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-accessing' }
PRExternalLinkTest >> testTitle [
	self instance reference: 'http://www.lukas-renggli.ch'.
	self assert: self instance title equals: 'http://www.lukas-renggli.ch'
]

{ #category : #'tests-accessing' }
PRExternalLinkTest >> testUrl [
	self instance reference: 'http://www.lukas-renggli.ch'.
	self assert: self instance url equals: 'http://www.lukas-renggli.ch'
]
