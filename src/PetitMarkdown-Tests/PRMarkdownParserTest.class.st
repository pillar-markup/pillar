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
