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
	initialText := canvas annotated: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #tests }
PRMicrodownWriterTest >> testAnnotated2 [
	self flag: #toDiscuss. 
	"I do not know but annotated is 
	!! a paragraph.... potentially on multiple line 
	like this
	
	So the example below is like two annotated and the test should not be blind on this fact.
	"
	"annotated: should have the responsibility to issue the terminating new line. "
	initialText := canvas annotated: 'Hello', String cr, 'Pharo'; contents.
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
	"PRCommentedBlock doesn't exist. Only lines exist."
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

{ #category : #'tests - header' }
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

{ #category : #tests }
PRMicrodownWriterTest >> testPreformatted [
	"= Hello Pharo"
	initialText := canvas annotated: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #tests }
PRMicrodownWriterTest >> testPreformatted2 [
	"= Hello Pharo"
	
	self flag: #toBeFixed.
	"First we should use the builder.
	Second = is not for preformatted but > is 
	Third the build API should manage the String cr not us"
	
	initialText := '= Hello', String cr, '= There'.
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
