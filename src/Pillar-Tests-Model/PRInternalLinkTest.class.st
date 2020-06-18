Class {
	#name : #PRInternalLinkTest,
	#superclass : #PRLinkTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRInternalLinkTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRInternalLinkTest >> actualClass [
	^ PRInternalLink
]

{ #category : #private }
PRInternalLinkTest >> referenceString [
	^ 'Page'
]

{ #category : #'tests-accessing' }
PRInternalLinkTest >> testAnchor [
	self instance anchor: 'zork'.
	self assert: self instance anchor equals: 'zork'.
	self assert: self instance hasAnchor
]

{ #category : #'tests-comparing' }
PRInternalLinkTest >> testEqualAnchor [
	self
		deny:
			(self actualClass new
				anchor: 'foo';
				yourself)
		equals:
			(self actualClass new
				anchor: 'bar';
				yourself)
]

{ #category : #tests }
PRInternalLinkTest >> testIsInternal [
	self assert: self instance isInternal
]

{ #category : #'tests-parsing' }
PRInternalLinkTest >> testParseAnchored [
	| wiki text tree |
	wiki := '*' , self referenceString , '@Anchor*'.
	text := self actualClass new
		reference: self referenceString;
		anchor: 'Anchor';
		title.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				reference: self referenceString;
				anchor: 'Anchor';
				yourself);
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRInternalLinkTest >> testParseEverything [
	| wiki text tree |
	wiki := '*Alias>' , self referenceString , '@Anchor*'.
	text := 'Alias'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				add: (PRText content: 'Alias');
				reference: self referenceString;
				anchor: 'Anchor';
				yourself);
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-accessing' }
PRInternalLinkTest >> testReferenceAsHTML [
	| link |
	link := PRInternalLink reference: 'foo.pillar'.
	self assert: link referenceAsHTML equals: 'foo.html'.
	link := PRInternalLink reference: 'foo.pilla'.
	self should: [ link referenceAsHTML ] raise: PRLinkWarning
]

{ #category : #'tests-accessing' }
PRInternalLinkTest >> testReferenceAsMarkdown [
	| link |
	link := PRInternalLink reference: 'foo.pillar'.
	self assert: link referenceAsMarkdown equals: 'foo.md'.
	link := PRInternalLink reference: 'foo.pilla'.
	self should: [ link referenceAsMarkdown ] raise: PRLinkWarning
]

{ #category : #'tests-accessing' }
PRInternalLinkTest >> testTitle [
	super testTitle.
	self instance reference: 'page'.
	self assert: self instance title equals: 'page'
]
