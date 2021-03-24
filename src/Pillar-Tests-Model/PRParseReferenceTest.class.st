Class {
	#name : #PRParseReferenceTest,
	#superclass : #PRParseDocumentGroupTest,
	#category : #'Pillar-Tests-Model-Parser'
}

{ #category : #private }
PRParseReferenceTest >> actualClass [
	^ PRReference
]

{ #category : #private }
PRParseReferenceTest >> markup [
	^ self subclassResponsibility
]

{ #category : #private }
PRParseReferenceTest >> referenceString [
	self subclassResponsibility
]

{ #category : #tests }
PRParseReferenceTest >> testNonTextAlias [
	| wiki tree |
	wiki := self markup , 'foo ""Alias"">' , self referenceString , self markup.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				add: (PRText content: 'foo ');
				add: (self addText: 'Alias' to: PRBoldFormat new);
				reference: self referenceString;
				yourself);
			yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRParseReferenceTest >> testParseAliased [
	| wiki tree |
	wiki := self markup , 'Alias>' , self referenceString , self markup.
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
PRParseReferenceTest >> testParseAliasedEmpty [
	| wiki tree |
	wiki := self markup , '>' , self referenceString , self markup.
	tree := PRDocument new
		add:
			(PRParagraph new
				add:
					(self actualClass new
						add: (PRText content: '');
						reference: self referenceString;
						yourself);
				yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseReferenceTest >> testParseBasic [
	| wiki tree |
	wiki := self markup  , self referenceString , self markup .

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
PRParseReferenceTest >> testParseEasyness [

	| wiki1 wiki2 tree |
	wiki1 := self markup , self lineEnding , self markup
	         , self referenceString.
	wiki2 := '\' , self markup , self lineEnding , '\' , self markup
	         , self referenceString.
	tree := PRDocument new
		        add: (PRParagraph new
				         add: (PRText content: self markup);
				         add: PRLineBreak new;
				         add: (PRText content: self markup , self referenceString);
				         yourself);
		        yourself.
	self parserAssertWiki: wiki1 equalsTree: tree.
	self parserAssertWiki: wiki2 equalsTree: tree
]

{ #category : #'tests-parsing' }
PRParseReferenceTest >> testParseEmpty [
	| wiki1 wiki2 tree |
	wiki1 := self markup , self markup.
	wiki2 := '\' , self markup , '\' , self markup.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: self markup , self markup);
				yourself);
		yourself.
	self parserAssertWiki: wiki1 equalsTree: tree.
	self parserAssertWiki: wiki2 equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseReferenceTest >> testParseEscaped [

	| wiki tree |
	wiki := 'Star \*' , self referenceString , '\*' , self lineEnding
	        , 'Cross \+' , self referenceString , '\+'.
	tree := PRDocument new
		        add: (PRParagraph new
				         add:
					         (PRText content: 'Star *' , self referenceString , '*');
				         add: PRLineBreak new;
				         add:
					         (PRText content: 'Cross +' , self referenceString , '+');
				         yourself);
		        yourself.
	self parserAssertWiki: wiki equalsTree: tree
]

{ #category : #'tests-parsing' }
PRParseReferenceTest >> testParseParameters [
	| wiki tree |
	wiki := self markup , 'Alias>' , self referenceString , '|a=1|b=2|c=true' , self markup .
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
PRParseReferenceTest >> testParseParametersEmpty [
	| wiki tree |
	wiki := self markup , 'Alias>' , self referenceString , '|a||b|' , self markup  .
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
PRParseReferenceTest >> testParseParametersEscaped [
	| wiki tree |
	wiki := self markup , 'Alias>' , self referenceString , '|2=\|\=|\|\==1' , self markup .
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
