"
I am a writer for GitHub Flavored Markdown
https://github.github.com/gfm/

GFM is based on CommonMark and adds couple of extensions.
"
Class {
	#name : #PRGithubMarkdownWriter,
	#superclass : #PRMarkdownWriter,
	#instVars : [
		'firstRow'
	],
	#category : 'Pillar-ExporterMarkdown'
}

{ #category : #accessing }
PRGithubMarkdownWriter class >> folderName [
	^ #githubmarkdown
]

{ #category : #accessing }
PRGithubMarkdownWriter class >> writerName [
	^ #githubmarkdown
]

{ #category : #protected }
PRGithubMarkdownWriter >> scriptLayout: aScript [
	| language |
	language := self languageForScript: aScript.
	canvas nextPutAll: '```'.
	language isSyntaxHighlightingPossible ifTrue: [ canvas raw: language printString ].
	canvas raw: aScript text, '```'
]

{ #category : #'visiting-document' }
PRGithubMarkdownWriter >> visitStrikethroughFormat: aFormat [
	"https://github.github.com/gfm/#strikethrough-extension-"

	canvas raw: '~'.
	self visitFormat: aFormat.
	canvas raw: '~'
]

{ #category : #'visiting-document' }
PRGithubMarkdownWriter >> visitTable: aTableCell [
	firstRow := true.
	self visitDocumentGroup: aTableCell.
	canvas newLine.
]

{ #category : #'visiting-document' }
PRGithubMarkdownWriter >> visitTableCell: aTableCell [
	canvas raw: aTableCell text
]

{ #category : #'visiting-document' }
PRGithubMarkdownWriter >> visitTableRow: aTableRow [
	"https://github.github.com/gfm/#tables-extension-"

	canvas raw: '| '.
	self visitAll: aTableRow children separatedBy: [ canvas raw: ' | ' ].
	canvas raw: ' |'.
	"GFM doesn't recognize tables without headers, so we always use the first row as headers (alternatively the header row would have to be empty)"
	firstRow
		ifTrue: [ firstRow := false.
			self writeTableConfiguration: aTableRow ].
	stream newLine
]

{ #category : #'visiting-document' }
PRGithubMarkdownWriter >> visitUnderlineFormat: aFormat [
	super visitFormat: aFormat 
]

{ #category : #'visiting-document' }
PRGithubMarkdownWriter >> writeTableColumnAlignment: aTableCell [
	"https://github.github.com/gfm/#tables-extension-"

	aTableCell isAlignedLeft | aTableCell isAlignedCenter
		ifTrue: [ canvas raw: ':' ].
	canvas raw: '---'.
	aTableCell isAlignedRight | aTableCell isAlignedCenter
		ifTrue: [ canvas raw: ':' ]
]

{ #category : #'visiting-document' }
PRGithubMarkdownWriter >> writeTableConfiguration: aTableRow [
	stream newLine.
	firstRow := false.
	canvas raw: '| '.
	aTableRow children
		do: [ :aTableCell | self writeTableColumnAlignment: aTableCell ]
		separatedBy: [ canvas raw: ' | ' ].
	canvas raw: ' |'
]
