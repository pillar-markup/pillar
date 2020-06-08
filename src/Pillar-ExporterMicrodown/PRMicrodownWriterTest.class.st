Class {
	#name : #PRMicrodownWriterTest,
	#superclass : #TestCase,
	#instVars : [
		'canvas',
		'parser',
		'writer',
		'initialText',
		'writtenText',
		'parsedBloc'
	],
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #accessing }
PRMicrodownWriterTest >> exampleText [
	^ 'Hello Pharo'
]

{ #category : #accessing }
PRMicrodownWriterTest >> parser [
	^ parser ifNil: [ parser := MicroDownParser new ]
]

{ #category : #running }
PRMicrodownWriterTest >> setUp [
	canvas := PRMicrodownCanvas on: String new writeStream

]

{ #category : #tests }
PRMicrodownWriterTest >> testAnnotated [
	"!! Hello Pharo"
	initialText := canvas annotated: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #tests }
PRMicrodownWriterTest >> testAnnotated2 [
	initialText := '!! Hello', String crlf, '!! Pharo'.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #tests }
PRMicrodownWriterTest >> testBold [
	"**Hello Pharo**"
	initialText := canvas bold: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #tests }
PRMicrodownWriterTest >> testComment [
	"% Hello Pharo"
	initialText := canvas comment: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #tests }
PRMicrodownWriterTest >> testExternalLink [
	"[Hello Pharo](url)"
	initialText := canvas externalLink: 'url' withDescription: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #tests }
PRMicrodownWriterTest >> testFigure [
	"![Hello Pharo](url)"
	initialText := canvas figure: 'url' withDescription: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #tests }
PRMicrodownWriterTest >> testHeader [
	"# Hello Pharo"
	initialText := canvas header: self exampleText withLevel: 1; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #tests }
PRMicrodownWriterTest >> testHeaderLvl3 [
	"### Hello Pharo"
	initialText := canvas header: self exampleText withLevel: 3; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #tests }
PRMicrodownWriterTest >> testItalic [
	"_Hello Pharo_"
	initialText := canvas italic: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText .
]

{ #category : #tests }
PRMicrodownWriterTest >> testMonospace [
	"`Hello Pharo`"
	initialText := canvas monospace: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #tests }
PRMicrodownWriterTest >> testStrike [
	"~Hello Pharo~"
	initialText := canvas strike: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #accessing }
PRMicrodownWriterTest >> writer [
	^ writer ifNil: [ writer := PRMicrodownWriter new ]
]
