Class {
	#name : #PRGithubMarkdownWriterTest,
	#superclass : #PRMarkdownWriterTest,
	#category : 'Pillar-Tests-ExporterMarkdown'
}

{ #category : #private }
PRGithubMarkdownWriterTest >> actualClass [
	^ PRGithubMarkdownWriter 
]

{ #category : #requirements }
PRGithubMarkdownWriterTest >> scriptWithCaptionBegin [
	^ '```'
]

{ #category : #requirements }
PRGithubMarkdownWriterTest >> scriptWithoutCaptionBegin [
	^ String cr, '```'
]

{ #category : #requirements }
PRGithubMarkdownWriterTest >> strikethroughFoo [
	^ '~foo~'
]

{ #category : #requirements }
PRGithubMarkdownWriterTest >> supportSyntaxHighlighting [
	^ true
]

{ #category : #requirements }
PRGithubMarkdownWriterTest >> tableBegin [
	^ '| '
]

{ #category : #requirements }
PRGithubMarkdownWriterTest >> tableCellWithFoo [
	^ '| foo'
]

{ #category : #requirements }
PRGithubMarkdownWriterTest >> tableCellWithHeadingFoo [
	^ '| foo'
]

{ #category : #requirements }
PRGithubMarkdownWriterTest >> tableRow [
	^ '| '
]

{ #category : #tests }
PRGithubMarkdownWriterTest >> testTableCenterAligned [
	| item alignment |
	alignment := #center.
	item := PRDocument new
		add:
			(PRTable new
				add:
					(PRTableRow new
						add: (PRTableCell align: alignment heading: true withAll: {PRText content: 'foo'}))).
	self assertWriting: item includesText: '| :---: |'
]

{ #category : #tests }
PRGithubMarkdownWriterTest >> testTableLeftAligned [
	| item alignment |
	alignment := #left.
	item := PRDocument new
		add:
			(PRTable new
				add:
					(PRTableRow new
						add: (PRTableCell align: alignment heading: true withAll: {PRText content: 'foo'}))).
	self assertWriting: item includesText: '| :--- |'
]

{ #category : #tests }
PRGithubMarkdownWriterTest >> testTableNotAligned [
	| item alignment |
	alignment := nil.
	item := PRDocument new
		add:
			(PRTable new
				add:
					(PRTableRow new
						add: (PRTableCell align: alignment heading: true withAll: {PRText content: 'foo'}))).
	self assertWriting: item includesText: '| --- |'
]

{ #category : #tests }
PRGithubMarkdownWriterTest >> testTableRightAligned [
	| item alignment |
	alignment := #right.
	item := PRDocument new
		add:
			(PRTable new
				add:
					(PRTableRow new
						add: (PRTableCell align: alignment heading: true withAll: {PRText content: 'foo'}))).
	self assertWriting: item includesText: '| ---: |'
]

{ #category : #tests }
PRGithubMarkdownWriterTest >> testTableWithHeader [
	| item |
	item := PRDocument new
		add:
			(PRTable new
				add:
					(PRTableRow new
						add: (PRTableCell align: nil heading: false withAll: {PRText content: 'foo'}))).
	self assertWriting: item includesText: '| foo |'.
	self assertWriting: item includesText: '| --- |'
]

{ #category : #requirements }
PRGithubMarkdownWriterTest >> underlineFoo [
	^ 'foo'
]
