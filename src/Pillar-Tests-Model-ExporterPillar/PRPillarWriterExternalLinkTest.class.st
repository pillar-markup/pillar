Class {
	#name : #PRPillarWriterExternalLinkTest,
	#superclass : #PRPillarWriterLinkTest,
	#category : #'Pillar-Tests-Model-ExporterPillar'
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
PRPillarWriterExternalLinkTest >> testLinkToAFigureIsExternalLink [
	| wiki tree |
	wiki := '*file://foo.png*'.

	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				reference: 'file://foo.png';
				yourself);
			yourself);
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]
