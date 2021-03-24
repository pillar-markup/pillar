Class {
	#name : #PRTextWriterFormatTest,
	#superclass : #PRTextWriterDocumentGroupTest,
	#instVars : [
		'otherClass',
		'markup',
		'actualClass'
	],
	#category : #'Pillar-Tests-Core-TextWriter'
}

{ #category : #'building suites' }
PRTextWriterFormatTest class >> isAbstract [
	^ false
]

{ #category : #'building suites' }
PRTextWriterFormatTest class >> testParameters [
	^ (ParametrizedTestMatrix new
			forSelector: #actualClass addOptions: PRFormat subclasses )
]

{ #category : #private }
PRTextWriterFormatTest >> actualClass [
	^ actualClass
]

{ #category : #private }
PRTextWriterFormatTest >> actualClass: aClass [
	actualClass := aClass
]

{ #category : #accessing }
PRTextWriterFormatTest >> otherClass [
	^ otherClass ifNil: [ otherClass := PRFormat allSubclasses detect: [ :each | self actualClass ~= each ] ]
]

{ #category : #running }
PRTextWriterFormatTest >> setUp [
	super setUp.
	markup := PRPillarGrammar markups at: self actualClass
]

{ #category : #'tests-parsing' }
PRTextWriterFormatTest >> testParseBasic [
	| text tree |
	text := '123'.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: '1');
				add: (self actualClass with: (PRText content: '2'));
				add: (PRText content: '3');
				yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterFormatTest >> testParseEnd [
	| text tree |
	text := '12'.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: '1');
				add: (self actualClass with: (PRText content: '2'));
				yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterFormatTest >> testParseEscaped [
	| text tree |
	text := ' ' , markup , markup.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: ' ' , markup , markup);
				yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterFormatTest >> testParseIncomplete [
	| text tree |
	text := '1' , markup , '2'.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: '1' , markup , '2');
				yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterFormatTest >> testParseMany [
	| text tree |
	text := '12345'.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: '1');
				add: (self actualClass with: (PRText content: '2'));
				add: (PRText content: '3');
				add: (self actualClass with: (PRText content: '4'));
				add: (PRText content: '5');
				yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterFormatTest >> testParseNested [
	| text tree |
	text := '12345'.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: '1');
				add:
					(self actualClass new
						add: (PRText content: '2');
						add:
							(self otherClass new
								add: (PRText content: '3');
								yourself);
						add: (PRText content: '4');
						yourself);
				add: (PRText content: '5');
				yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterFormatTest >> testParseNestedTight [
	| text tree |
	text := ' '.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: ' ');
				add: (self actualClass new add: self otherClass new yourself);
				yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterFormatTest >> testParseWithNewLine [

	| text tree |
	text := '12' , self lineEnding , '34'.
	tree := PRDocument new
		        add: (PRParagraph new
				         add: (PRText content: '1');
				         add:
					         (self actualClass with:
							          (PRText content: '2' , self lineEnding , '3'));
				         add: (PRText content: '4');
				         yourself);
		        yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterFormatTest >> testParseWithSpace [
	| text tree |
	text := '12 34'.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: '1');
				add: (self actualClass with: (PRText content: '2 3'));
				add: (PRText content: '4');
				yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]
