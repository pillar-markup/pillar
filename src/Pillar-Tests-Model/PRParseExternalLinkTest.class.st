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
PRParseExternalLinkTest >> testLinkToAFigureIsExternalLink [
	| wiki tree |
	wiki := '*file://foo.png*'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				reference: 'file://foo.png';
				yourself);
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]
