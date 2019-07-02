"
PPMarkdownLineGrammarTest covers the linewise syntax part of Markdown
"
Class {
	#name : #PPMarkdownLineGrammarTest,
	#superclass : #PP2CompositeNodeTest,
	#category : #'PetitMarkdown-Tests'
}

{ #category : #accessing }
PPMarkdownLineGrammarTest >> parserClass [
	^ PPMarkdownLineGrammar 
]

{ #category : #fixtures }
PPMarkdownLineGrammarTest >> simple [ 
	^ '
foo
bar

  
    baz
qux

> meh

end'
]

{ #category : #'tests-single lines' }
PPMarkdownLineGrammarTest >> testBasicLine [
	self parse: 'Just a simple line' rule: #line
]

{ #category : #'tests-single lines' }
PPMarkdownLineGrammarTest >> testBlankLine [
	self parse: '   ' rule: #blankLine
]

{ #category : #'tests-single lines' }
PPMarkdownLineGrammarTest >> testEmptyLine [
	self parse: '' rule: #blankLine
]

{ #category : #'tests-single lines' }
PPMarkdownLineGrammarTest >> testHeadingLine1 [
	self
		parse: '# Hello, this is an atx-style title'
		rule: #atxHeadingLine
]

{ #category : #'tests-single lines' }
PPMarkdownLineGrammarTest >> testHeadingLine2 [
	self
		parse: '##Hello, this is an atx-style title'
		rule: #atxHeadingLine
]

{ #category : #'tests-single lines' }
PPMarkdownLineGrammarTest >> testHeadingLine3 [
	self
		parse: '### Hello, this is an atx-style title #######'
		rule: #atxHeadingLine
]

{ #category : #'tests-single lines' }
PPMarkdownLineGrammarTest >> testIndentedBlankLine [
	self parse: '       ' rule: #line
]

{ #category : #'tests-single lines' }
PPMarkdownLineGrammarTest >> testIndentedQuotedLine [
	self parse: '    > >     hello' rule: #line
]

{ #category : #'tests-single lines' }
PPMarkdownLineGrammarTest >> testMixedIndentedLine [
	self parse: '    	    Three indents, middle a tab' rule: #line
]

{ #category : #'tests-single lines' }
PPMarkdownLineGrammarTest >> testQuotedLine [
	self parse: '> A quotation line' rule: #line
]

{ #category : #'tests-multiple lines' }
PPMarkdownLineGrammarTest >> testSeveralLines [
	self
		parse: self simple
		rule: #lines
]

{ #category : #'tests-multiple lines' }
PPMarkdownLineGrammarTest >> testSimpleDocument [
	self parse: self simple
]

{ #category : #'tests-single lines' }
PPMarkdownLineGrammarTest >> testSpaceIndentedLine [
	self parse: '    A line that starts with 4 spaces' rule: #line
]

{ #category : #'tests-single lines' }
PPMarkdownLineGrammarTest >> testTabIndentedLine [
	self parse: '	A line that starts with one tab' rule: #line
]
