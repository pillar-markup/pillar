Class {
	#name : #PRMicrodownWriterTest,
	#superclass : #TestCase,
	#instVars : [
		'parser',
		'writer',
		'initialText',
		'writtenText',
		'parsedBloc',
		'builder'
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
	builder := PRMicrodownTextualBuilder on: String new writeStream

	
]

{ #category : #'tests - annotated' }
PRMicrodownWriterTest >> testAnnotated [
	"!!Note Pharo is cool and microdown too."
	
	initialText := builder annotated: 'Note' paragraph:  'Pharo is cool and microdown too'; contents.
	parsedBloc := self parser parse: initialText readStream.
	self assert: parsedBloc children first label equals: 'Note'.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - annotated' }
PRMicrodownWriterTest >> testAnnotatedOnMultipleLines [

	initialText := builder annotated: 'Note' paragraph:  'Pharo is cool
and microdown too'; contents.
	parsedBloc := self parser parse: initialText readStream.
	self assert: parsedBloc children first label equals: 'Note'.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - formatting' }
PRMicrodownWriterTest >> testBold [
	"**Hello Pharo**"
	initialText := builder bold: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - comments' }
PRMicrodownWriterTest >> testComment [
	"% Hello Pharo"
	
	initialText := builder comment: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - comments' }
PRMicrodownWriterTest >> testCommentOnMultipleLines [
	"% Hello 
	% Pharo"
	
	initialText := builder comment: 'Hello
Pharo' ; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - external link' }
PRMicrodownWriterTest >> testExternalLink [
	"[Hello Pharo](url)"
	initialText := builder externalLink: '/url' withDescription: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - figures' }
PRMicrodownWriterTest >> testFigure [
	"![Hello Pharo](url)"
	initialText := builder figure: 'url' withDescription: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - figures' }
PRMicrodownWriterTest >> testFigureWithArgument [
	"![Hello Pharo](url|label=fig&caption=This is a caption."
	self skip. 
	self flag: #todo.
	initialText := builder figure: 'url|label=fig1&caption=This is a caption.&width=80' withDescription: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - figures' }
PRMicrodownWriterTest >> testFigureWithArgumentContainingFormatting [
	"![Hello Pharo](url|label=fig&caption=This is a caption and it can contain **bol** but also `code`."
	self skip. 
	self flag: #todo.
	initialText := builder figure: 'url|label=fig&caption=This is a caption and it can contain **bol** but also `code`' withDescription: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeader [
	"# Hello Pharo"
	initialText := builder header: [:b | self exampleText] withLevel: 1; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeaderLvl3 [
	"### Hello Pharo"
	initialText := builder header: [:b | self exampleText] withLevel: 3; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeaderWithBold [
	"# Hello **Pharo** is cool"

	initialText := builder 
							header: [ :b | b text: 'Hello '.
											 b bold: 'Pharo'.
											 b text: ' is cool'] 
							withLevel: 1;					
							contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeaderWithCode [
	"# Hello `Pharo` is cool"
	
	initialText := builder 
							header: [ :b | b text: 'Hello '.
											 b monospace: 'Pharo'.
											 b text: ' is cool']  withLevel: 1;				
							contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeaderWithExternalLink [
	"# Hello [Pharo](http://pharo.org) is cool"

	initialText := builder header: [ :b | b text: 'Hello '.
											 b externalLink: 'http://pharo.org/' withDescription: 'Pharo'.
											 b text: ' is cool'] 
										withLevel: 1;			
							contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeaderWithItalic [
	"# Hello _Pharo_ is cool"

	initialText := builder 
							header: [ :b | b text: 'Hello '.
											 b italic: 'Pharo'.
											 b text: ' is cool']  withLevel: 1;				
							contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeaderWithStrike [
	"# Hello ~Pharo~ is cool"

	initialText := builder 
							header: [ :b | b text: 'Hello '.
											 b strike: 'Pharo'.
											 b text: ' is cool']  withLevel: 1;				
							contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - formatting' }
PRMicrodownWriterTest >> testItalic [
	"_Hello Pharo_"
	initialText := builder italic: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText .
]

{ #category : #'tests - formatting' }
PRMicrodownWriterTest >> testMonospace [
	"`Hello Pharo`"
	initialText := builder monospace: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - quote block' }
PRMicrodownWriterTest >> testQuoteBlock [
	"> Hello Pharo"
	initialText := builder quoteBlock: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - quote block' }
PRMicrodownWriterTest >> testQuoteBlockOnMultipleLines [
	"> Hello Pharo"
	self skip.
	"The problem here is that quote a un seul text donc si on traite les formatting nous allons perdre les cr 
	et du coup on ne peut pas avoir la semantique d'isomorphisme. 
	But the question is if we want it:
		if quote block is a pure preformatted this is easy. Noformatting so we keep the cr. 
		if quote block is more different way to describe a paragraph then we cannot keep the cr
		because in that case
		
			aa *bb
			bb* cc
			should be handled
			as
				aa boldbb 
				boldbb cc
			so the termination due to to new line should propagate to the next line.
			
		"
	initialText := builder quoteBlock: self exampleText; newLine; quoteBlock: self exampleText ; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - quote block' }
PRMicrodownWriterTest >> testQuoteBlockOnMultipleLinesWithFormatting [
	"> Hello Pharo"
	"to be changed explicit use of ** should only for testing strange human edition"
	self skip.
	initialText := builder quoteBlock: 'hello **bold**'; newLine; quoteBlock: self exampleText ; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	"MicInlineSplitter new start: parsedBloc children first text"
	self assert: writtenText equals: initialText.
	

	"MicInlineSplitter new start: 'hello **bold**', String cr, 'Pharo'
	ne garde pas les sauts de ligne.
	Donc cela veut dire que pour les lignes qui ne sont pas des paragraphes et que l'on veut garder comme
	telles on ne peut pas avoir des formatting qui debutent et finissent sur deux lignes.
	"
]

{ #category : #'tests - code block' }
PRMicrodownWriterTest >> testSimpleCodeBlock [
	"```
basic
really basic
```."
	
	initialText := builder codeblock: 'basic
really basic'; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #'tests - formatting' }
PRMicrodownWriterTest >> testStrike [
	"~Hello Pharo~"
	initialText := builder strike: self exampleText; contents.
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: initialText.
]

{ #category : #accessing }
PRMicrodownWriterTest >> writer [
	^ writer
]
