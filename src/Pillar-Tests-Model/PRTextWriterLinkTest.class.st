Class {
	#name : #PRTextWriterLinkTest,
	#superclass : #PRTextWriterReferenceTest,
	#category : #'Pillar-Tests-Model-TextWriter'
}

{ #category : #private }
PRTextWriterLinkTest >> actualClass [
	^ PRLink
]

{ #category : #private }
PRTextWriterLinkTest >> markup [
	^ PRPillarParser markups at: PRLink
]

{ #category : #tests }
PRTextWriterLinkTest >> testIsBroken [
	self assert: (self instance isBroken or: [ self instance isBroken not ])
]

{ #category : #tests }
PRTextWriterLinkTest >> testIsExternal [
	self deny: self instance isExternal
]

{ #category : #tests }
PRTextWriterLinkTest >> testIsInternal [
	self deny: self instance isInternal
]

{ #category : #tests }
PRTextWriterLinkTest >> testIsLink [
	self assert: self instance isLink
]

{ #category : #'tests-parsing' }
PRTextWriterLinkTest >> testParseAliased [
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
PRTextWriterLinkTest >> testParseAliasedEmpty [
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
PRTextWriterLinkTest >> testParseBasic [
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
PRTextWriterLinkTest >> testParseParameters [
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
PRTextWriterLinkTest >> testParseParametersEmpty [
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
PRTextWriterLinkTest >> testParseParametersEscaped [
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
