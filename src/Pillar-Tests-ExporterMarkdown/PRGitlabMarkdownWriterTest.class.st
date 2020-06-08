Class {
	#name : #PRGitlabMarkdownWriterTest,
	#superclass : #PRMarkdownWriterTest,
	#category : #'Pillar-Tests-ExporterMarkdown'
}

{ #category : #private }
PRGitlabMarkdownWriterTest >> actualClass [
	^ PRGitlabMarkdownWriter 
]

{ #category : #requirements }
PRGitlabMarkdownWriterTest >> strikethroughFoo [
	^ '~~foo~~'
]

{ #category : #requirements }
PRGitlabMarkdownWriterTest >> tableBegin [
	^ '| '
]

{ #category : #requirements }
PRGitlabMarkdownWriterTest >> tableCellWithFoo [
	^ '| foo'
]

{ #category : #requirements }
PRGitlabMarkdownWriterTest >> tableCellWithHeadingFoo [
	^ '| foo'
]

{ #category : #requirements }
PRGitlabMarkdownWriterTest >> tableRow [
	^ '| '
]

{ #category : #tests }
PRGitlabMarkdownWriterTest >> testTableCenterAligned [
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
PRGitlabMarkdownWriterTest >> testTableLeftAligned [
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
PRGitlabMarkdownWriterTest >> testTableNotAligned [
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
PRGitlabMarkdownWriterTest >> testTableRightAligned [
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
PRGitlabMarkdownWriterTest >> testTableWithHeader [
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
