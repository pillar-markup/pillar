"
I am a writer for GitLab Flavored Markdown
https://docs.gitlab.com/ee/user/markdown.html

Note that Gitlab Flavored Markdown is not an extension of CommonMark, however the syntax is similar for the most part.
"
Class {
	#name : #PRGitlabMarkdownWriter,
	#superclass : #PRMarkdownWriter,
	#instVars : [
		'firstRow'
	],
	#category : 'Pillar-ExporterMarkdown'
}

{ #category : #'visiting-document' }
PRGitlabMarkdownWriter >> visitStrikethroughFormat: aFormat [
	"https://docs.gitlab.com/ee/user/markdown.html#emphasis"

	canvas raw: '~~'.
	self visitFormat: aFormat.
	canvas raw: '~~'
]

{ #category : #'visiting-document' }
PRGitlabMarkdownWriter >> visitTable: aTableCell [
	firstRow := true.
	self visitDocumentGroup: aTableCell.
	canvas newLine.
]

{ #category : #'visiting-document' }
PRGitlabMarkdownWriter >> visitTableCell: aTableCell [
	canvas raw: aTableCell text
]

{ #category : #'visiting-document' }
PRGitlabMarkdownWriter >> visitTableRow: aTableRow [
	"https://docs.gitlab.com/ee/user/markdown.html#tables"

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
PRGitlabMarkdownWriter >> writeTableColumnAlignment: aTableCell [
	"https://docs.gitlab.com/ee/user/markdown.html#tables"

	aTableCell isAlignedLeft | aTableCell isAlignedCenter
		ifTrue: [ canvas raw: ':' ].
	canvas raw: '---'.
	aTableCell isAlignedRight | aTableCell isAlignedCenter
		ifTrue: [ canvas raw: ':' ]
]

{ #category : #'visiting-document' }
PRGitlabMarkdownWriter >> writeTableConfiguration: aTableRow [
	stream newLine.
	firstRow := false.
	canvas raw: '| '.
	aTableRow children
		do: [ :aTableCell | self writeTableColumnAlignment: aTableCell ]
		separatedBy: [ canvas raw: ' | ' ].
	canvas raw: ' |'
]
