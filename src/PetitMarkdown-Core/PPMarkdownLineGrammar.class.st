"
A PPMarkdownLineGrammar recognizes the linewise syntax of Markdown, i.e. single lines preceded by indents or quote marks.
"
Class {
	#name : #PPMarkdownLineGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'document',
		'line',
		'blankLine',
		'indentLine',
		'quoteLine',
		'textLine',
		'atxHeadingLine',
		'indent',
		'quote',
		'newline',
		'endOfLine',
		'lines',
		'nonIndent',
		'atxStart'
	],
	#category : #'PetitMarkdown-Core'
}

{ #category : #grammar }
PPMarkdownLineGrammar >> atxHeadingLine [
	| hashes |
	hashes := $# asPParser star.
	^ atxStart
		,
			((#any asPParser starLazy: hashes trim , endOfLine) min: 1) flatten
				trim , hashes token trim
]

{ #category : #token }
PPMarkdownLineGrammar >> atxStart [
	^ ($# asPParser min: 1 max: 6) token
]

{ #category : #grammar }
PPMarkdownLineGrammar >> blankLine [
	^ (nonIndent, endOfLine and) flatten
]

{ #category : #token }
PPMarkdownLineGrammar >> bullet [
	^ nonIndent , ($+ asPParser / $* asPParser / $- asPParser) token
		, Character space asPParser
]

{ #category : #grammar }
PPMarkdownLineGrammar >> document [
	^ lines
]

{ #category : #token }
PPMarkdownLineGrammar >> endOfLine [
	^ newline / nil asPParser end
]

{ #category : #token }
PPMarkdownLineGrammar >> enumerator [
	^ nonIndent , (#digit asPParser plus , $. asPParser) token
		, Character space asPParser
]

{ #category : #token }
PPMarkdownLineGrammar >> indent [
	^ (Character tab asPParser / (Character space asPParser times: 4))
		token
]

{ #category : #grammar }
PPMarkdownLineGrammar >> indentLine [
	^ indent, line
]

{ #category : #grammar }
PPMarkdownLineGrammar >> line [
	^ quoteLine
	/ indentLine
	/ blankLine
	/ textLine
]

{ #category : #grammar }
PPMarkdownLineGrammar >> lines [
	^ line delimitedBy: newline
]

{ #category : #token }
PPMarkdownLineGrammar >> newline [
	"Copied from PPToken>>newline, because it's private there.
	#newline asParser is incorrect because it represents a class of characters."

	^ ((Character cr asPParser , Character lf asPParser optional)
		/ Character lf asPParser) token
]

{ #category : #token }
PPMarkdownLineGrammar >> nonIndent [
	^ Character space asPParser star max: 3
]

{ #category : #token }
PPMarkdownLineGrammar >> quote [
	^ nonIndent
		, ($> asPParser , Character space asPParser optional) token
]

{ #category : #grammar }
PPMarkdownLineGrammar >> quoteLine [
	^ quote, line
]

{ #category : #accessing }
PPMarkdownLineGrammar >> start [
	^ document end
]

{ #category : #grammar }
PPMarkdownLineGrammar >> textLine [
	^ (#any asPParser starLazy: endOfLine) flatten
]
