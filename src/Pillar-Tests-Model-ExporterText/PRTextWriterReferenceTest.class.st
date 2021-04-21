Class {
	#name : #PRTextWriterReferenceTest,
	#superclass : #PRTextWriterDocumentGroupTest,
	#category : #'Pillar-Tests-Model-ExporterText'
}

{ #category : #private }
PRTextWriterReferenceTest >> actualClass [
	^ PRReference
]

{ #category : #private }
PRTextWriterReferenceTest >> markup [
	^ self subclassResponsibility
]

{ #category : #private }
PRTextWriterReferenceTest >> referenceString [
	self subclassResponsibility
]

{ #category : #tests }
PRTextWriterReferenceTest >> testNonTextAlias [
	| text tree |

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

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterReferenceTest >> testParseAliased [
	| text tree |
	text := 'Alias'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				add: (PRText content: 'Alias');
				reference: self referenceString;
				yourself);
			yourself);
		yourself.
	
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterReferenceTest >> testParseAliasedEmpty [
	| text tree |
	
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
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterReferenceTest >> testParseBasic [
	| text tree |
	
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

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterReferenceTest >> testParseEasyness [

	| text tree |
	text := self markup , self lineEnding , self markup
	        , self referenceString.
	tree := PRDocument new
		        add: (PRParagraph new
				         add: (PRText content: self markup);
				         add: PRLineBreak new;
				         add: (PRText content: self markup , self referenceString);
				         yourself);
		        yourself.

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterReferenceTest >> testParseEmpty [
	| text tree |
	
	text := self markup , self markup.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: self markup , self markup);
				yourself);
		yourself.
	
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterReferenceTest >> testParseEscaped [

	| text tree |
	text := 'Star *' , self referenceString , '*' , self lineEnding
	        , 'Cross +' , self referenceString , '+'.
	tree := PRDocument new
		        add: (PRParagraph new
				         add:
					         (PRText content: 'Star *' , self referenceString , '*');
				         add: PRLineBreak new;
				         add:
					         (PRText content: 'Cross +' , self referenceString , '+');
				         yourself);
		        yourself.

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterReferenceTest >> testParseParameters [
	| text tree |

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

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterReferenceTest >> testParseParametersEmpty [
	| text tree |

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

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterReferenceTest >> testParseParametersEscaped [
	| text tree |

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
	
	self textWriterAssertTree: tree equalsText: text
]
