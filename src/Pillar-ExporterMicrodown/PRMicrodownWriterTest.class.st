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
	#category : #'Pillar-ExporterMicrodown-Tests'
}

{ #category : #running }
PRMicrodownWriterTest >> exampleText [
	^ 'Hello Pharo'
]

{ #category : #accessing }
PRMicrodownWriterTest >> parser [
	^ parser 
]

{ #category : #running }
PRMicrodownWriterTest >> setUp [
	super setUp.
	parser := MicroDownParser new.
	writer := PRMicrodownWriter new.
	canvas := PRMicrodownCanvas on: String new writeStream

	
]

{ #category : #tests }
PRMicrodownWriterTest >> testAnnotated [
	"!! Hello Pharo"
	self skip.
	"in progress"
	initialText := canvas annotated: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - formatting' }
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
	self skip.
	"in progress"
	"initialText := canvas comment: self exampleText; contents."
	initialText := '% Hey
% llo'.
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
	"conflict with annotatedParagraph block markup"
	initialText := canvas figure: 'url' withDescription: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeader [
	"# Hello Pharo"
	initialText := canvas header: self exampleText withLevel: 3; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeaderWithBold [
	"# Hello **Pharo** is cool"
	
	initialText := canvas 
							header: 'Hello ', (canvas bold: 'Pharo'),  'is cool' withLevel: 3;				
							contents.
	self halt.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - formatting' }
PRMicrodownWriterTest >> testItalic [
	"_Hello Pharo_"
	initialText := canvas italic: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText .
]

{ #category : #'tests - formatting' }
PRMicrodownWriterTest >> testMonospace [
	"`Hello Pharo`"
	initialText := canvas monospace: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - formatting' }
PRMicrodownWriterTest >> testStrike [
	"~Hello Pharo~"
	initialText := canvas strike: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #accessing }
PRMicrodownWriterTest >> writer [
	^ writer
]
