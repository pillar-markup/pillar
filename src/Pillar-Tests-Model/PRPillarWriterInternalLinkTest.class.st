Class {
	#name : #PRPillarWriterInternalLinkTest,
	#superclass : #PRPillarWriterLinkTest,
	#category : #'Pillar-Tests-Model-PillarWriter'
}

{ #category : #testing }
PRPillarWriterInternalLinkTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarWriterInternalLinkTest >> actualClass [
	^ PRInternalLink
]

{ #category : #private }
PRPillarWriterInternalLinkTest >> referenceString [
	^ 'Page'
]

{ #category : #'tests-parsing' }
PRPillarWriterInternalLinkTest >> testParseAnchored [
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

	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterInternalLinkTest >> testParseEverything [
	| wiki  tree |
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
	
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]
