Class {
	#name : #PRPillarWriterLinkTest,
	#superclass : #PRPillarWriterReferenceTest,
	#category : #'Pillar-Tests-Model-PillarWriter'
}

{ #category : #private }
PRPillarWriterLinkTest >> actualClass [
	^ PRLink
]

{ #category : #private }
PRPillarWriterLinkTest >> markup [
	^ PRPillarParser markups at: PRLink
]

{ #category : #tests }
PRPillarWriterLinkTest >> testIsBroken [
	self assert: (self instance isBroken or: [ self instance isBroken not ])
]

{ #category : #tests }
PRPillarWriterLinkTest >> testIsExternal [
	self deny: self instance isExternal
]

{ #category : #tests }
PRPillarWriterLinkTest >> testIsInternal [
	self deny: self instance isInternal
]

{ #category : #tests }
PRPillarWriterLinkTest >> testIsLink [
	self assert: self instance isLink
]

{ #category : #'tests-parsing' }
PRPillarWriterLinkTest >> testParseAliased [
	| wiki text tree |
	wiki := '*Alias>' , self referenceString , '*'.
	text := 'Alias'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				add: (PRText content: 'Alias');
				reference: self referenceString;
				yourself);
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarWriterLinkTest >> testParseAliasedEmpty [
	| wiki text tree |
	wiki := '*>' , self referenceString , '*'.
	text := ''.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				add: (PRText content: '');
				reference: self referenceString;
				yourself);
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarWriterLinkTest >> testParseBasic [
	| wiki text tree |
	wiki := '*' , self referenceString , '*'.
	text := self actualClass new
		reference: self referenceString;
		title.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				reference: self referenceString;
				yourself);
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarWriterLinkTest >> testParseParameters [
	| wiki text tree |
	wiki := '*Alias>' , self referenceString , '|a=1|b=2|c=true*'.
	text := 'Alias'.
	tree := PRDocument new
		add:
				(PRParagraph new
						add:
								(self actualClass new
										add: (PRText content: 'Alias');
										reference: self referenceString;
										parameters:
												(OrderedDictionary new
														add: 'a' -> 1;
														add: 'b' -> 2;
														add: 'c' -> true;
														yourself);
										yourself);
						yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarWriterLinkTest >> testParseParametersEmpty [
	| wiki text tree |
	wiki := '*Alias>' , self referenceString , '|a||b|*'.
	text := 'Alias'.
	tree := PRDocument new
		add:
				(PRParagraph new
						add:
								(self actualClass new
										add: (PRText content: 'Alias');
										reference: self referenceString;
										parameters:
												(OrderedDictionary new
														add: 'a' -> true;
														add: 'b' -> true;
														yourself);
										yourself);
						yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarWriterLinkTest >> testParseParametersEscaped [
	| wiki text tree |
	wiki := '*Alias>' , self referenceString , '|2=\|\=|\|\==1*'.
	text := 'Alias'.
	tree := PRDocument new
		add:
				(PRParagraph new
						add:
								(self actualClass new
										add: (PRText content: 'Alias');
										reference: self referenceString;
										parameters:
												(OrderedDictionary new
														add: '2' -> '|=';
														add: '|=' -> 1;
														yourself);
										yourself);
						yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]
