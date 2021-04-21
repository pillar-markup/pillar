Class {
	#name : #PRParseMailLinkTest,
	#superclass : #PRParseExternalLinkTest,
	#category : #'Pillar-Tests-Model-PetitPillar'
}

{ #category : #private }
PRParseMailLinkTest >> actualClass [
	^ PRMailLink
]

{ #category : #private }
PRParseMailLinkTest >> referenceString [
	^ 'renggli@gmail.com'
]

{ #category : #'as yet unclassified' }
PRParseMailLinkTest >> testLinkToAFigureIsExternalLink [
	"This test has no meaning in PRMailLinkTest."
]

{ #category : #'tests-parsing' }
PRParseMailLinkTest >> testParseBogus [
	| wiki tree |
	wiki := '*ab12@x.com*'.
	
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				reference: 'ab12@x.com';
				yourself);
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]
