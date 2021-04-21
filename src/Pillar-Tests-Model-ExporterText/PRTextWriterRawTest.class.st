Class {
	#name : #PRTextWriterRawTest,
	#superclass : #PRTextWriterTextTest,
	#category : #'Pillar-Tests-Model-ExporterText'
}

{ #category : #private }
PRTextWriterRawTest >> actualClass [
	^ PRRaw
]

{ #category : #'tests-parsing' }
PRTextWriterRawTest >> testParseBasic [
	| text tree |

	text := 'abc'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'abc');
			yourself);
		yourself.
	
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterRawTest >> testParseEmpty [
	| text tree |

	text := ''.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: '');
			yourself);
		yourself.

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterRawTest >> testParseMultiline [

	| text tree nLine |
	nLine := self lineEnding.

	text := 'a' , nLine , 'b'.
	tree := PRDocument new
		        add: (PRParagraph new
				         add: (PRRaw content: 'a' , nLine , 'b');
				         yourself);
		        yourself.

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterRawTest >> testParseMultiple [
	| text tree |

	text := 'abc'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'a');
			add: (PRText content: 'b');
			add: (PRRaw content: 'c');
			yourself);
		yourself.

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterRawTest >> testParseMultipleMultiline [

	| text tree nLine |
	nLine := self lineEnding.

	text := 'a' , nLine , 'bcd' , nLine , 'e'.
	tree := PRDocument new
		        add: (PRParagraph new
				         add: (PRRaw content: 'a' , nLine , 'b');
				         add: (PRText content: 'c');
				         add: (PRRaw content: 'd' , nLine , 'e');
				         yourself);
		        yourself.

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterRawTest >> testParseStrange [
	|  text tree |
	text := 'a{{||}}b'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'a{{||}}b');
			yourself);
		yourself.

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterRawTest >> testParseTypeHtml [
	| text tree |

	text := ''.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'abc' type: 'html');
			yourself);
		yourself.

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterRawTest >> testParseTypeLatex [
	| text tree |
	text := ''.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'abc' type: 'latex');
			yourself);
		yourself.

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterRawTest >> testParseTypeText [
	| text tree |

	text := 'abc'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'abc' type: 'text');
			yourself);
		yourself.

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-accessing' }
PRTextWriterRawTest >> testType [
	self instance type: 'html'.
	self assert: self instance type equals: 'html'
]
