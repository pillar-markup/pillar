Class {
	#name : #PRPillarWriterReferenceTest,
	#superclass : #PRPillarWriterDocumentGroupTest,
	#category : #'Pillar-Tests-Model-ExporterPillar'
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
	
	self pillarWriterAssertTree: tree equalsWiki: wiki.

]

{ #category : #'tests-parsing' }
PRPillarWriterReferenceTest >> testParseAliased [
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
	
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterReferenceTest >> testParseAliasedEmpty [
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
	
	self pillarWriterAssertTree: tree equalsWiki: wiki.

]

{ #category : #'tests-parsing' }
PRPillarWriterReferenceTest >> testParseBasic [
	| wiki tree |
	wiki := self markup  , self referenceString , self markup .

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
PRPillarWriterReferenceTest >> testParseEasyness [

	| wiki2 tree |
	wiki2 := '\' , self markup , self lineEnding , '\' , self markup
	         , self referenceString.

	tree := PRDocument new
		        add: (PRParagraph new
				         add: (PRText content: self markup);
				         add: PRLineBreak new;
				         add: (PRText content: self markup , self referenceString);
				         yourself);
		        yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki2
]

{ #category : #'tests-parsing' }
PRPillarWriterReferenceTest >> testParseEmpty [
	| wiki2 text tree |
	
	wiki2 := '\' , self markup , '\' , self markup.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: self markup , self markup);
				yourself);
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki2.

]

{ #category : #'tests-parsing' }
PRPillarWriterReferenceTest >> testParseEscaped [

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

	self pillarWriterAssertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarWriterReferenceTest >> testParseParameters [
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
	
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterReferenceTest >> testParseParametersEscaped [
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

	self pillarWriterAssertTree: tree equalsWiki: wiki.

]
