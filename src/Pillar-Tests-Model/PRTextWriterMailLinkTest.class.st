Class {
	#name : #PRTextWriterMailLinkTest,
	#superclass : #PRTextWriterExternalLinkTest,
	#category : #'Pillar-Tests-Model-TextWriter'
}

{ #category : #private }
PRTextWriterMailLinkTest >> actualClass [
	^ PRMailLink
]

{ #category : #private }
PRTextWriterMailLinkTest >> referenceString [
	^ 'renggli@gmail.com'
]

{ #category : #'as yet unclassified' }
PRTextWriterMailLinkTest >> testLinkToAFigureIsExternalLink [
	"This test has no meaning in PRMailLinkTest."
]

{ #category : #'tests-parsing' }
PRTextWriterMailLinkTest >> testParseBogus [
	| text tree |
	text := 'ab12@x.com'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				reference: 'ab12@x.com';
				yourself);
			yourself);
		yourself.

	self textWriterAssertTree: tree equalsText: text
]
