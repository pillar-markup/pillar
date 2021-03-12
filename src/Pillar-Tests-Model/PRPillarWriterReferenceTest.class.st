Class {
	#name : #PRPillarWriterReferenceTest,
	#superclass : #PRPillarWriterDocumentGroupTest,
	#category : #'Pillar-Tests-Model-PillarWriter'
}

{ #category : #private }
PRPillarWriterReferenceTest >> actualClass [
	^ PRReference
]

{ #category : #private }
PRPillarWriterReferenceTest >> markup [
	^ self subclassResponsibility
]

{ #category : #private }
PRPillarWriterReferenceTest >> referenceString [
	self subclassResponsibility
]

{ #category : #tests }
PRPillarWriterReferenceTest >> testNonTextAlias [
	| wiki text tree |
	wiki := self markup , 'foo ""Alias"">' , self referenceString , self markup.
	text := 'foo Alias'.
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
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarWriterReferenceTest >> testParseAliased [
	| wiki text tree |
	wiki := self markup , 'Alias>' , self referenceString , self markup.
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
PRPillarWriterReferenceTest >> testParseAliasedEmpty [
	| wiki text tree |
	wiki := self markup , '>' , self referenceString , self markup.
	text := ''.
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
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarWriterReferenceTest >> testParseBasic [
	| wiki text tree |
	wiki := self markup  , self referenceString , self markup .
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
PRPillarWriterReferenceTest >> testParseEasyness [
	| wiki1 wiki2 text tree |
	wiki1 := self markup , Smalltalk os lineEnding , self markup , self referenceString.
	wiki2 := '\' , self markup , Smalltalk os lineEnding , '\' , self markup , self referenceString.
	text := self markup , Smalltalk os lineEnding , self markup , self referenceString.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: self markup);
				add: PRLineBreak new;
				add: (PRText content: self markup , self referenceString);
				yourself);
		yourself.
	self parserAssertWiki: wiki1 equalsTree: tree.
	self parserAssertWiki: wiki2 equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki2.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarWriterReferenceTest >> testParseEmpty [
	| wiki1 wiki2 text tree |
	wiki1 := self markup , self markup.
	wiki2 := '\' , self markup , '\' , self markup.
	text := self markup , self markup.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: self markup , self markup);
				yourself);
		yourself.
	self parserAssertWiki: wiki1 equalsTree: tree.
	self parserAssertWiki: wiki2 equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki2.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarWriterReferenceTest >> testParseEscaped [
	| wiki text tree |
	wiki := 'Star \*' , self referenceString , '\*' , Smalltalk os lineEnding , 'Cross \+' , self referenceString , '\+'.
	text := 'Star *' , self referenceString , '*' , Smalltalk os lineEnding , 'Cross +' , self referenceString , '+'.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: 'Star *' , self referenceString , '*');
						add: PRLineBreak new;
						add: (PRText content: 'Cross +' , self referenceString , '+');
						yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarWriterReferenceTest >> testParseParameters [
	| wiki text tree |
	wiki := self markup , 'Alias>' , self referenceString , '|a=1|b=2|c=true' , self markup .
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
PRPillarWriterReferenceTest >> testParseParametersEmpty [
	| wiki text tree |
	wiki := self markup , 'Alias>' , self referenceString , '|a||b|' , self markup  .
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
PRPillarWriterReferenceTest >> testParseParametersEscaped [
	| wiki text tree |
	wiki := self markup , 'Alias>' , self referenceString , '|2=\|\=|\|\==1' , self markup .
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
