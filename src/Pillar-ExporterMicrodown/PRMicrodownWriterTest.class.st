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

{ #category : #'tests - annotated' }
PRMicrodownWriterTest >> testAnnotated [
	"!!Note Pharo is cool and microdown too."
	
	initialText := canvas annotated: 'Important?' paragraph:  self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	self assert: parsedBloc children first label equals: 'Important?'.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - annotated' }
PRMicrodownWriterTest >> testAnnotatedOnMultipleLines [

	| body |
	self skip.
	body := self exampleText, String cr, self exampleText.
	initialText := canvas annotated: 'Note' paragraph: body; contents.
	parsedBloc := self parser parse: initialText readStream.
	self assert: parsedBloc children first label equals: 'Note'.
	self assert: parsedBloc children first body equals: body.
	self halt.
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

{ #category : #'tests - comments' }
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

{ #category : #'tests - header' }
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
							header: 'Hello ', (canvas boldish: 'Pharo'),  ' is cool' withLevel: 3;				
							contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeaderWithCode [
	"# Hello `Pharo` is cool"
	
	initialText := canvas 
							header: 'Hello ', (canvas monospacish: 'Pharo'),  ' is cool' withLevel: 2;				
							contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeaderWithItalic [
	"# Hello ~Pharo~ is cool"

	initialText := canvas 
							header: 'Hello ', (canvas strikish: 'Pharo'),  ' is cool' withLevel: 5;				
							contents.
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
	self skip. 
	"this should not be annotated"
	initialText := canvas annotated: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #tests }
PRMicrodownWriterTest >> testPreformatted2 [
	"= Hello Pharo"
	self skip.
	self flag: #Laurine.
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
