Class {
	#name : #PRPillarWriterExternalLinkTest,
	#superclass : #PRPillarWriterLinkTest,
	#category : #'Pillar-Tests-Model-PillarWriter'
}

{ #category : #testing }
PRPillarWriterExternalLinkTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarWriterExternalLinkTest >> actualClass [
	^ PRExternalLink
]

{ #category : #private }
PRPillarWriterExternalLinkTest >> referenceString [
	^ 'http://www.lukas-renggli.ch'
]

{ #category : #tests }
PRPillarWriterExternalLinkTest >> testIsExternal [
	self assert: self instance isExternal
]

{ #category : #tests }
PRPillarWriterExternalLinkTest >> testLinkToAFigureIsExternalLink [
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
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-accessing' }
PRPillarWriterExternalLinkTest >> testTitle [
	self instance reference: 'http://www.lukas-renggli.ch'.
	self assert: self instance title equals: 'http://www.lukas-renggli.ch'
]

{ #category : #'tests-accessing' }
PRPillarWriterExternalLinkTest >> testUrl [
	self instance reference: 'http://www.lukas-renggli.ch'.
	self assert: self instance url equals: 'http://www.lukas-renggli.ch'
]
