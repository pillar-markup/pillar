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

{ #category : #'tests-parsing' }
PRPillarWriterLinkTest >> testParseAliased [
	| wiki tree |
	wiki := '*Alias>' , self referenceString , '*'.

	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				add: (PRText content: 'Alias');
				reference: self referenceString;
				yourself);
			yourself);
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterLinkTest >> testParseAliasedEmpty [
	| wiki tree |
	wiki := '*>' , self referenceString , '*'.
	
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				add: (PRText content: '');
				reference: self referenceString;
				yourself);
			yourself);
		yourself.
	
	self pillarWriterAssertTree: tree equalsWiki: wiki.

]

{ #category : #'tests-parsing' }
PRPillarWriterLinkTest >> testParseBasic [
	| wiki tree |
	wiki := '*' , self referenceString , '*'.
	
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				reference: self referenceString;
				yourself);
			yourself);
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterLinkTest >> testParseParameters [
	| wiki  tree |
	wiki := '*Alias>' , self referenceString , '|a=1|b=2|c=true*'.

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

	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterLinkTest >> testParseParametersEscaped [
	| wiki  tree |
	wiki := '*Alias>' , self referenceString , '|2=\|\=|\|\==1*'.

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

	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]
