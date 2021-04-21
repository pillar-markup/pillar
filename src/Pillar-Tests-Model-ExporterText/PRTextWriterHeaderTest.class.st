Class {
	#name : #PRTextWriterHeaderTest,
	#superclass : #PRTextWriterDocumentGroupTest,
	#category : #'Pillar-Tests-Model-ExporterText'
}

{ #category : #testing }
PRTextWriterHeaderTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRTextWriterHeaderTest >> actualClass [
	^ PRHeader
]

{ #category : #'tests-parsing' }
PRTextWriterHeaderTest >> testParseEmpty [
	| text tree |
	text := ''.
	tree := PRDocument new
		add: (PRHeader new
			level: 1;
			yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterHeaderTest >> testParseLevel1 [
	| text tree |
	text := 'foo'.
	tree := PRDocument new
		add: ((PRHeader new)
			level: 1;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterHeaderTest >> testParseLevel2 [
	| text tree |
	text := 'foo'.
	tree := PRDocument new
		add: ((PRHeader new)
			level: 2;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterHeaderTest >> testParseLevel3 [
	| text tree |
	text := 'foo'.
	tree := PRDocument new
		add: ((PRHeader new)
			level: 3;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterHeaderTest >> testParseLevel4 [
	| text tree |
	text := 'foo'.
	tree := PRDocument new
		add: ((PRHeader new)
			level: 4;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterHeaderTest >> testParseLevel5 [
	| text tree |
	text := 'foo'.
	tree := PRDocument new
		add: ((PRHeader new)
			level: 5;
			add: (PRText content: 'foo');
			yourself);
		yourself.

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterHeaderTest >> testParseLevel6 [
	| text tree |
	text := 'foo'.
	tree := PRDocument new
		add: ((PRHeader new)
			level: 6;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterHeaderTest >> testParseMultiline [

	| text tree nLine |
	nLine := self lineEnding.
	text := 'Hello This is' , nLine , 'bold end' , nLine , 'new'.
	tree := PRDocument new
		        add: (PRHeader new
				         level: 2;
				         add: (PRText content: 'Hello ');
				         add:
					         (self
						          addText: 'This is' , nLine , 'bold'
						          to: PRBoldFormat new);
				         add: (PRText content: ' end');
				         yourself);
		        add: (self addText: 'new' to: PRParagraph new);
		        yourself.

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterHeaderTest >> testParseNested [
	| text tree |

	text := 'Hello Link'.
	tree := PRDocument new
		add: (PRHeader new
			level: 2;
			add: (PRText content: 'Hello ');
			add: (PRInternalLink new
				reference: 'Link';
				yourself);
			yourself);
		yourself.

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterHeaderTest >> testParseWithTrailingSpaces [
	| text tree |
	text := 'foo'.
	tree := PRDocument new
		add: ((PRHeader new)
			level: 1;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	
	self textWriterAssertTree: tree equalsText: text
]
