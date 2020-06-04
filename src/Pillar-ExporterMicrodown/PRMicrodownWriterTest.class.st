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
	^ parser ifNil: [ parser := MicroDownParser new. ^ parser ]
]

{ #category : #running }
PRMicrodownWriterTest >> setUp [
	canvas := PRMicrodownCanvas on: String new writeStream

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
PRMicrodownWriterTest >> testHeader [
	"# Hello Pharo"
	initialText := canvas header: self exampleText; contents.
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

{ #category : #accessing }
PRMicrodownWriterTest >> writer [
	^ writer ifNil: [ writer := PRMicrodownWriter new. ^ writer ]
]
