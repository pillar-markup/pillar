"
A PPMarkdownLineGrammar recognizes the linewise syntax of Markdown, i.e. single lines preceded by indents or quote marks.
"
Class {
	#name : #PPMarkdownLineGrammar,
	#superclass : #PPCompositeParser,
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
	hashes := $# asParser star.
	^ atxStart,
		(#any asParser plusLazy: (hashes trim, endOfLine)) flatten trim,
		hashes token trim
]

{ #category : #token }
PPMarkdownLineGrammar >> atxStart [
	^ ($# asParser min: 1 max: 6) token
]

{ #category : #grammar }
PPMarkdownLineGrammar >> blankLine [
	^ (nonIndent, endOfLine and) flatten
]

{ #category : #token }
PPMarkdownLineGrammar >> bullet [
	^ nonIndent,
		($+ asParser / $* asParser / $- asParser) token,
		Character space asParser
]

{ #category : #grammar }
PPMarkdownLineGrammar >> document [
	^ lines
]

{ #category : #token }
PPMarkdownLineGrammar >> endOfLine [
	^ newline / nil asParser end
]

{ #category : #token }
PPMarkdownLineGrammar >> enumerator [
	^ nonIndent,
		(#digit asParser plus, $. asParser) token,
		Character space asParser
]

{ #category : #token }
PPMarkdownLineGrammar >> indent [
	^ (Character tab asParser / (Character space asParser times: 4)) token
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
	^ ((Character cr asParser , Character lf asParser optional)
		/ Character lf asParser) token
]

{ #category : #token }
PPMarkdownLineGrammar >> nonIndent [
	^ Character space asParser max: 3
]

{ #category : #token }
PPMarkdownLineGrammar >> quote [
	^ nonIndent,
		($> asParser,
		Character space asParser optional) token
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
	^ (#any asParser starLazy: endOfLine) flatten
]
