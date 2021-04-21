Class {
	#name : #PRParseInternalLinkTest,
	#superclass : #PRParseLinkTest,
	#category : #'Pillar-Tests-Model-PetitPillar'
}

{ #category : #testing }
PRParseInternalLinkTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRParseInternalLinkTest >> actualClass [
	^ PRInternalLink
]

{ #category : #private }
PRParseInternalLinkTest >> referenceString [
	^ 'Page'
]

{ #category : #'tests-parsing' }
PRParseInternalLinkTest >> testParseAnchored [
	| wiki tree |
	wiki := '*' , self referenceString , '@Anchor*'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				reference: self referenceString;
				anchor: 'Anchor';
				yourself);
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	

]

{ #category : #'tests-parsing' }
PRParseInternalLinkTest >> testParseEverything [
	| wiki tree |
	wiki := '*Alias>' , self referenceString , '@Anchor*'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				add: (PRText content: 'Alias');
				reference: self referenceString;
				anchor: 'Anchor';
				yourself);
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]
