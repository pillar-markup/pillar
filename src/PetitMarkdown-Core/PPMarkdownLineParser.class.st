"
A PPMarkdownLineParser recognizes PPMarkdownLines from the input stream

"
Class {
	#name : #PPMarkdownLineParser,
	#superclass : #PPMarkdownLineGrammar,
	#category : #'PetitMarkdown-Core'
}

{ #category : #grammar }
PPMarkdownLineParser >> atxHeadingLine [
	^ super atxHeadingLine ==> [:nodes|
		PPMarkdownHeadingLine
			level: nodes first size
			with: nodes second ]
]

{ #category : #grammar }
PPMarkdownLineParser >> blankLine [
	^ super blankLine ==> [ :string | PPMarkdownBlankLine with: string]
]

{ #category : #grammar }
PPMarkdownLineParser >> document [
	^ super document ==> [ :nodes | PPMarkdownDocument lines: nodes ]
]

{ #category : #grammar }
PPMarkdownLineParser >> indentLine [
	^ super indentLine ==> [ :nodes | PPMarkdownIndentLine with: nodes second]
]

{ #category : #grammar }
PPMarkdownLineParser >> lines [
	^ super lines oddNodes
]

{ #category : #grammar }
PPMarkdownLineParser >> quoteLine [
	^ super quoteLine ==> [ :nodes | PPMarkdownQuoteLine with: nodes second]
]

{ #category : #grammar }
PPMarkdownLineParser >> textLine [
	^ super textLine ==> [ :string | PPMarkdownTextLine with: string]
]
