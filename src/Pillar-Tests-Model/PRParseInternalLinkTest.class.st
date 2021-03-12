Class {
	#name : #PRParseInternalLinkTest,
	#superclass : #PRParseLinkTest,
	#category : #'Pillar-Tests-Model-Parser'
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

{ #category : #'tests-accessing' }
PRParseInternalLinkTest >> testAnchor [
	self instance anchor: 'zork'.
	self assert: self instance anchor equals: 'zork'.
	self assert: self instance hasAnchor
]

{ #category : #'tests-comparing' }
PRParseInternalLinkTest >> testEqualAnchor [
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
PRParseInternalLinkTest >> testIsInternal [
	self assert: self instance isInternal
]

{ #category : #'tests-parsing' }
PRParseInternalLinkTest >> testParseAnchored [
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
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRParseInternalLinkTest >> testParseEverything [
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
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-accessing' }
PRParseInternalLinkTest >> testReferenceAsHTML [
	| link |
	link := PRInternalLink reference: 'foo.pillar'.
	self assert: link referenceAsHTML equals: 'foo.html'.
	link := PRInternalLink reference: 'foo.pilla'.
	self should: [ link referenceAsHTML ] raise: PRLinkWarning
]

{ #category : #'tests-accessing' }
PRParseInternalLinkTest >> testReferenceAsMarkdown [
	| link |
	link := PRInternalLink reference: 'foo.pillar'.
	self assert: link referenceAsMarkdown equals: 'foo.md'.
	link := PRInternalLink reference: 'foo.pilla'.
	self should: [ link referenceAsMarkdown ] raise: PRLinkWarning
]

{ #category : #'tests-accessing' }
PRParseInternalLinkTest >> testTitle [
	super testTitle.
	self instance reference: 'page'.
	self assert: self instance title equals: 'page'
]
