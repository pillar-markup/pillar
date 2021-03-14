Class {
	#name : #PRTextWriterHorizontalRuleTest,
	#superclass : #PRTextWriterDocumentItemTest,
	#category : #'Pillar-Tests-Model-TextWriter'
}

{ #category : #testing }
PRTextWriterHorizontalRuleTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRTextWriterHorizontalRuleTest >> actualClass [
	^ PRHorizontalRule
]

{ #category : #'tests-parsing' }
PRTextWriterHorizontalRuleTest >> testParseBasic [
	| text tree |

	text := self textString.
	tree := PRDocument new
		add: PRHorizontalRule new;
		yourself.

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterHorizontalRuleTest >> testParseMultiple [
	| text tree nLine |
	nLine := Smalltalk os lineEnding.
	text := self textString , nLine , self textString , nLine , nLine , self textString.
	tree := PRDocument new
		add: PRHorizontalRule new;
		add: PRHorizontalRule new;
		add: PREmptyParagraph new;
		add: PRHorizontalRule new;
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterHorizontalRuleTest >> testParseParagraph [
	| text tree |

	text := '_ is parsed as paragraph'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: '_ is parsed as paragraph');
			yourself);
		yourself.

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterHorizontalRuleTest >> testParseSpaces [
	| text tree |
	text := self textString.
	tree := PRDocument new
		add: PRHorizontalRule new;
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #private }
PRTextWriterHorizontalRuleTest >> textString [
	^ String new: 40 withAll: $-
]
