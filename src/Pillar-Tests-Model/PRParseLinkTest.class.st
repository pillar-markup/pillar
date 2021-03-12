Class {
	#name : #PRParseLinkTest,
	#superclass : #PRParseReferenceTest,
	#category : #'Pillar-Tests-Model-Parser'
}

{ #category : #private }
PRParseLinkTest >> actualClass [
	^ PRLink
]

{ #category : #private }
PRParseLinkTest >> markup [
	^ PRPillarParser markups at: PRLink
]

{ #category : #'tests-parsing' }
PRParseLinkTest >> testParseAliased [
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
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseLinkTest >> testParseAliasedEmpty [
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
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseLinkTest >> testParseBasic [
	| wiki tree |
	wiki := '*' , self referenceString , '*'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				reference: self referenceString;
				yourself);
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseLinkTest >> testParseParameters [
	| wiki tree |
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
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseLinkTest >> testParseParametersEmpty [
	| wiki tree |
	wiki := '*Alias>' , self referenceString , '|a||b|*'.
	
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
	
]

{ #category : #'tests-parsing' }
PRParseLinkTest >> testParseParametersEscaped [
	| wiki tree |
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
	self parserAssertWiki: wiki equalsTree: tree.

]
