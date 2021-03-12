Class {
	#name : #PRPillarWriterMailLinkTest,
	#superclass : #PRPillarWriterExternalLinkTest,
	#category : #'Pillar-Tests-Model-PillarWriter'
}

{ #category : #private }
PRPillarWriterMailLinkTest >> actualClass [
	^ PRMailLink
]

{ #category : #private }
PRPillarWriterMailLinkTest >> referenceString [
	^ 'renggli@gmail.com'
]

{ #category : #'as yet unclassified' }
PRPillarWriterMailLinkTest >> testLinkToAFigureIsExternalLink [
	"This test has no meaning in PRMailLinkTest."
]

{ #category : #'tests-parsing' }
PRPillarWriterMailLinkTest >> testParseBogus [
	| wiki text tree |
	wiki := '*ab12@x.com*'.
	text := 'ab12@x.com'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				reference: 'ab12@x.com';
				yourself);
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]
