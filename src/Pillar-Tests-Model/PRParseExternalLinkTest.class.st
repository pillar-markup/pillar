Class {
	#name : #PRParseExternalLinkTest,
	#superclass : #PRParseLinkTest,
	#category : #'Pillar-Tests-Model-Parser'
}

{ #category : #testing }
PRParseExternalLinkTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRParseExternalLinkTest >> actualClass [
	^ PRExternalLink
]

{ #category : #private }
PRParseExternalLinkTest >> referenceString [
	^ 'http://www.lukas-renggli.ch'
]

{ #category : #tests }
PRParseExternalLinkTest >> testIsExternal [
	self assert: self instance isExternal
]

{ #category : #tests }
PRParseExternalLinkTest >> testLinkToAFigureIsExternalLink [
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
PRParseExternalLinkTest >> testTitle [
	self instance reference: 'http://www.lukas-renggli.ch'.
	self assert: self instance title equals: 'http://www.lukas-renggli.ch'
]

{ #category : #'tests-accessing' }
PRParseExternalLinkTest >> testUrl [
	self instance reference: 'http://www.lukas-renggli.ch'.
	self assert: self instance url equals: 'http://www.lukas-renggli.ch'
]
