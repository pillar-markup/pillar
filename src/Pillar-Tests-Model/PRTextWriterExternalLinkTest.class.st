Class {
	#name : #PRTextWriterExternalLinkTest,
	#superclass : #PRTextWriterLinkTest,
	#category : #'Pillar-Tests-Model-TextWriter'
}

{ #category : #testing }
PRTextWriterExternalLinkTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRTextWriterExternalLinkTest >> actualClass [
	^ PRExternalLink
]

{ #category : #private }
PRTextWriterExternalLinkTest >> referenceString [
	^ 'http://www.lukas-renggli.ch'
]

{ #category : #tests }
PRTextWriterExternalLinkTest >> testIsExternal [
	self assert: self instance isExternal
]

{ #category : #tests }
PRTextWriterExternalLinkTest >> testLinkToAFigureIsExternalLink [
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
PRTextWriterExternalLinkTest >> testTitle [
	self instance reference: 'http://www.lukas-renggli.ch'.
	self assert: self instance title equals: 'http://www.lukas-renggli.ch'
]

{ #category : #'tests-accessing' }
PRTextWriterExternalLinkTest >> testUrl [
	self instance reference: 'http://www.lukas-renggli.ch'.
	self assert: self instance url equals: 'http://www.lukas-renggli.ch'
]
