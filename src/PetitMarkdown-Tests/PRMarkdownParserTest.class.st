Class {
	#name : #PRMarkdownParserTest,
	#superclass : #PPMarkdownGrammarTest,
	#category : #'PetitMarkdown-Tests'
}

{ #category : #asserting }
PRMarkdownParserTest >> assertStart: aStartInteger stop: aStopIndex [
	self assert: result notNil.
	self assert: result start equals: aStartInteger.
	self assert: result stop equals: aStopIndex
]

{ #category : #accessing }
PRMarkdownParserTest >> parserClass [
	^ PRMarkdownParser
]

{ #category : #tests }
PRMarkdownParserTest >> testCode [
	super testCode.
	self
		assert: result
		equals: (PRMonospaceFormat withAll: {(PRText content: 'f(x*2*y)')})
]

{ #category : #tests }
PRMarkdownParserTest >> testCode2 [
	super testCode2.
	self
		assert: result
		equals: (PRMonospaceFormat withAll: {(PRText content: 'code with ` are escaped')})
]

{ #category : #tests }
PRMarkdownParserTest >> testCode3 [
	super testCode3.
	self
		assert: result
		equals: (PRMonospaceFormat withAll: {(PRText content: 'code with `are` esaped')})
]

{ #category : #tests }
PRMarkdownParserTest >> testCodeBlock [
	super testCodeBlock.
	self
		assert: result text
			equals:
			'foo
	^ bar';
		assert: result language
			equals: (PRAbstractScriptLanguage for: 'smalltalk');
		assert: (result parameters at: 'method') equals: true;
		assert: result label equals: 'foo';
		assert: result caption text equals: 'the source code of Foo>>#foo'
]

{ #category : #tests }
PRMarkdownParserTest >> testCodeBlock2 [
	super testCodeBlock2.
	self
		assert: result text
			equals:
			'foo
	^ bar';
		assert: result language
			equals: (PRAbstractScriptLanguage for: 'unknown');
		assert: (result parameters at: 'method') equals: true;
		assert: result label equals: 'foo';
		assert: result caption text equals: 'the source code of Foo>>#foo'
]

{ #category : #tests }
PRMarkdownParserTest >> testEmphasis1 [
	super testEmphasis1.
	self
		assert: result
		equals: (PRItalicFormat withAll: {(PRText content: 'subtly suggested')})
]

{ #category : #tests }
PRMarkdownParserTest >> testEmphasis2 [
	super testEmphasis2.
	self
		assert: result
		equals: (PRItalicFormat withAll: {(PRText content: 'subtly suggested')})
]

{ #category : #tests }
PRMarkdownParserTest >> testHeadingAtx1 [
	super testHeadingAtx1.
	self
		assert: result
		equals:
			(PRHeader
				withAll: {(PRText content: 'Hello, this is an atx-style title')}
				level: 1)
]

{ #category : #tests }
PRMarkdownParserTest >> testHeadingAtx2 [
	super testHeadingAtx2.
	self
		assert: result
		equals:
			(PRHeader
				withAll: {(PRText content: 'Hello, this is an atx-style title')}
				level: 2)
]

{ #category : #tests }
PRMarkdownParserTest >> testHeadingAtx3 [
	super testHeadingAtx3.
	self
		assert: result
		equals:
			(PRHeader
				withAll: {(PRText content: 'Hello, this is an atx-style title')}
				level: 3)
]

{ #category : #tests }
PRMarkdownParserTest >> testHeadingAtx4 [
	super testHeadingAtx4.
	self
		assert: result
		equals:
			(PRHeader
				withAll:
					{(PRText content: 'Hello, this is an ').
					(PRBoldFormat withAll: {(PRText content: 'atx-style')}).
					(PRText content: ' title')}
				level: 3)
]

{ #category : #tests }
PRMarkdownParserTest >> testHeadingSetext1 [
	super testHeadingSetext1.
	self
		assert: result
		equals:
			(PRHeader
				withAll: {(PRText content: 'Hello, this is a setext-style title')}
				level: 1)
]

{ #category : #tests }
PRMarkdownParserTest >> testHeadingSetext2 [
	super testHeadingSetext2.
	self
		assert: result
		equals:
			(PRHeader
				withAll: {(PRText content: 'Hello, this is a setext-style title')}
				level: 2)
]

{ #category : #tests }
PRMarkdownParserTest >> testHeadingSetext3 [ 
	super testHeadingSetext3 .
	self
		assert: result
		equals:
			(PRHeader
				withAll:
					{(PRText content: 'Hello, this is a ').
					(PRItalicFormat withAll: {(PRText content: 'setext-style')}).
					(PRText content: ' title')}
				level: 2)
]

{ #category : #tests }
PRMarkdownParserTest >> testStrong1 [
	super testStrong1.
	self
		assert: result
		equals: (PRBoldFormat withAll: {(PRText content: 'loud and clear')})
]

{ #category : #tests }
PRMarkdownParserTest >> testStrong2 [
	super testStrong2.
	self
		assert: result
		equals: (PRBoldFormat withAll: {(PRText content: 'loud and clear')})
]

{ #category : #tests }
PRMarkdownParserTest >> testText [
	super testText.
	self assert: result equals: (PRText content: 'this is a normal text')
]
