Class {
	#name : #PRReferenceTest,
	#superclass : #PRDocumentGroupTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #private }
PRReferenceTest >> actualClass [
	^ PRReference
]

{ #category : #private }
PRReferenceTest >> markup [
	^ self subclassResponsibility
]

{ #category : #private }
PRReferenceTest >> referenceString [
	self subclassResponsibility
]

{ #category : #tests }
PRReferenceTest >> testAlias [
	self deny: self instance hasAlias.

	self instance add: self fooInstance.
	self assert: self instance hasAlias.
	self assert: self instance alias equals: 'foo'.

	self instance add: self barInstance.
	self assert: self instance hasAlias.
	self assert: self instance alias equals: 'foobar'
]

{ #category : #'tests-accessing' }
PRReferenceTest >> testAnchor [
	self deny: self instance hasAnchor
]

{ #category : #'tests-comparing' }
PRReferenceTest >> testEqualReference [
	self
		deny:
			(self actualClass new
				reference: 'foo';
				yourself)
		equals:
			(self actualClass new
				reference: 'bar';
				yourself)
]

{ #category : #'tests-parameters' }
PRReferenceTest >> testHasParameter [
	self instance parameters: (Dictionary with: 'foo' -> 'zork' with: 'bar' -> nil).
	self assert: (self instance hasParameter: 'foo').
	self assert: (self instance hasParameter: 'bar').
	self deny: (self instance hasParameter: 'zork')
]

{ #category : #tests }
PRReferenceTest >> testNonTextAlias [
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
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parameters' }
PRReferenceTest >> testParameterAt [
	self instance parameters: (Dictionary with: 'foo' -> 'bar').
	self assert: (self instance parameters at: 'foo' ifAbsent: [ nil ]) equals: 'bar'.
	self assert: (self instance parameters at: 'bar' ifAbsent: [ nil ]) isNil
]

{ #category : #'tests-parameters' }
PRReferenceTest >> testParameterAtIfAbsent [
	self instance parameters: (Dictionary with: 'foo' -> 'bar').
	self assert: (self instance parameters at: 'foo' ifAbsent: [ 'zork' ]) equals: 'bar'.
	self assert: (self instance parameters at: 'bar' ifAbsent: [ 'zork' ]) equals: 'zork'
]

{ #category : #'tests-parameters' }
PRReferenceTest >> testParameterAtIfPresent [
	self instance parameters: (Dictionary with: 'foo' -> 'bar').
	self assert: (self instance parameters at: 'foo' ifPresent: [ :value | '!' , value ]) equals: '!bar'.
	self assert: (self instance parameters at: 'bar' ifPresent: [ :value | '!' , value ]) isNil
]

{ #category : #'tests-parameters' }
PRReferenceTest >> testParameterAtPut [
	self assert: (self instance parameters at: 'foo' put: 'bar') equals: 'bar'.
	self assert: self instance parameters size equals: 1.
	self assert: self instance parameters keys first equals: 'foo'.
	self assert: self instance parameters values first equals: 'bar'.

	self assert: (self instance parameters at: 'foo' put: 'zork') equals: 'zork'.
	self assert: self instance parameters size equals: 1.
	self assert: self instance parameters keys first equals: 'foo'.
	self assert: self instance parameters values first equals: 'zork'
]

{ #category : #'tests-parameters' }
PRReferenceTest >> testParameterCopy [
	| copy |
	self instance parameters at: 'class' put: 'active'.
	copy := self instance copy.
	copy parameters at: 'class' put: 'inactive'.
	copy parameters at: 'foo' put: 'bar'.

	self assert: (self instance parameters at: 'class') equals: 'active'.
	self deny: (self instance hasParameter: 'foo').

	self assert: (copy parameters at: 'class') equals: 'inactive'.
	self assert: (copy parameters at: 'foo') equals: 'bar'
]

{ #category : #'tests-parameters' }
PRReferenceTest >> testParameters [
	self assertEmpty: self instance parameters.
	self instance parameters: (Array with: 'foo' -> 'bar').
	self assert: self instance parameters size equals: 1
]

{ #category : #'tests-parsing' }
PRReferenceTest >> testParseAliased [
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
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRReferenceTest >> testParseAliasedEmpty [
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
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRReferenceTest >> testParseBasic [
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
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRReferenceTest >> testParseEasyness [
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
	self assertWiki: wiki1 equalsTree: tree.
	self assertWiki: wiki2 equalsTree: tree.
	self assertTree: tree equalsWiki: wiki2.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRReferenceTest >> testParseEmpty [
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
	self assertWiki: wiki1 equalsTree: tree.
	self assertWiki: wiki2 equalsTree: tree.
	self assertTree: tree equalsWiki: wiki2.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRReferenceTest >> testParseEscaped [
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
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRReferenceTest >> testParseParameters [
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
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRReferenceTest >> testParseParametersEmpty [
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
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRReferenceTest >> testParseParametersEscaped [
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
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-accessing' }
PRReferenceTest >> testReference [
	self instance reference: 'zork'.
	self assert: self instance reference equals: 'zork'
]

{ #category : #'tests-accessing' }
PRReferenceTest >> testTitle [
	self deny: self instance title isNotNil
]
