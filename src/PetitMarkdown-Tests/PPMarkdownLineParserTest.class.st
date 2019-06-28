"
PPMarkdownLineParserTest covers conversion of markdown syntax to PPMarkdownLine objects

"
Class {
	#name : #PPMarkdownLineParserTest,
	#superclass : #PPMarkdownLineGrammarTest,
	#category : #'PetitMarkdown-Tests'
}

{ #category : #accessing }
PPMarkdownLineParserTest >> parserClass [
	^ PPMarkdownLineParser
]

{ #category : #'tests-single lines' }
PPMarkdownLineParserTest >> testBasicLine [
	super testBasicLine.
	
	self deny: result isPrefixed
]

{ #category : #'tests-single lines' }
PPMarkdownLineParserTest >> testBlankLine [
	super testBlankLine.
	self assert: result isBlank
]

{ #category : #'tests-single lines' }
PPMarkdownLineParserTest >> testHeadingLine1 [
	super testHeadingLine1.
	
	self assert: result isHeading.
	self assert: result level equals: 1.
	self assert: result content equals: 'Hello, this is an atx-style title'
]

{ #category : #'tests-single lines' }
PPMarkdownLineParserTest >> testHeadingLine2 [
	super testHeadingLine2.
	
	self assert: result isHeading.
	self assert: result level equals: 2.
	self assert: result content equals: 'Hello, this is an atx-style title'
]

{ #category : #'tests-single lines' }
PPMarkdownLineParserTest >> testHeadingLine3 [
	super testHeadingLine3.
	
	self assert: result isHeading.
	self assert: result level equals: 3.
	self assert: result content equals: 'Hello, this is an atx-style title'
]

{ #category : #'tests-single lines' }
PPMarkdownLineParserTest >> testIndentedBlankLine [
	super testIndentedBlankLine.
	self assert: result isIndented.
	self assert: result inner isBlank
]

{ #category : #'tests-single lines' }
PPMarkdownLineParserTest >> testIndentedQuotedLine [
	super testIndentedQuotedLine.
	
	self assert: result isPrefixed.
	self assert: result isIndented.
	self assert: result indentLevel equals: 1.
	self assert: result content equals: 'hello'
]

{ #category : #'tests-single lines' }
PPMarkdownLineParserTest >> testIndentedQuotedLineNext [
	super testIndentedQuotedLine.
		
	self assert: result isPrefixed.
	self assert: result isIndented.
	self assert: result indentLevel equals: 1.
	self assert: result content equals: 'hello'.
	
	self assert: result inner isPrefixed.
	self assert: result inner isQuoted.
	self assert: result inner quoteLevel equals: 2.
	self assert: result inner content equals: 'hello'.
]

{ #category : #'tests-single lines' }
PPMarkdownLineParserTest >> testMixedIndentedLine [
	super testMixedIndentedLine.
	
	self assert: result isPrefixed.
	self assert: result isIndented.
	self assert: result indentLevel equals: 3.
	self assert: result content equals: 'Three indents, middle a tab'
]

{ #category : #'tests-single lines' }
PPMarkdownLineParserTest >> testQuotedLine [
	super testQuotedLine.
	
	self assert: result isPrefixed.
	self assert: result isQuoted.
	self assert: result quoteLevel equals: 1.
	self assert: result content equals: 'A quotation line'
]

{ #category : #'tests-multiple lines' }
PPMarkdownLineParserTest >> testSeveralLines [
	super testSeveralLines.
	
	self assert: result size = 11.

	self assert: result first isBlank.
	self deny:   result second isPrefixed.
	self assert: result sixth isIndented.
	self assert: result sixth content = 'baz'.
	self assert: result ninth isQuoted.
	self assert: result ninth content = 'meh'
]

{ #category : #'tests-multiple lines' }
PPMarkdownLineParserTest >> testSimpleDocument [
	super testSimpleDocument.
	self assert: result size equals: 4
]

{ #category : #'tests-single lines' }
PPMarkdownLineParserTest >> testSpaceIndentedLine [
	super testSpaceIndentedLine.
	
	self assert: result isPrefixed.
	self assert: result isIndented.
	self assert: result indentLevel equals: 1.
	self assert: result content equals: 'A line that starts with 4 spaces'
]

{ #category : #'tests-single lines' }
PPMarkdownLineParserTest >> testTabIndentedLine [
	super testTabIndentedLine.
	
	self assert: result isPrefixed.
	self assert: result isIndented.
	self assert: result indentLevel equals: 1.
	self assert: result content equals: 'A line that starts with one tab'
]
