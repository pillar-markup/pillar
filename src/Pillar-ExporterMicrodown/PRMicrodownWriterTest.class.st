"
This class contains tests designed in the way that we will be able to remove the pillar transformation in the future and still reuse the tests.
Therefore the input is Microdown generated via the Microdown builder, then 
such Microdown text is parsed and transformed as Pillar, then compare that the output is the same as the orginal generated code. 
"
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

{ #category : #running }
PRMicrodownWriterTest >> exampleTextMultipleLines [
	^ 'Hello
Pharo'
]

{ #category : #running }
PRMicrodownWriterTest >> exampleTextMultipleLinesWithNewLine [
	^ 'Hello

Pharo'
]

{ #category : #running }
PRMicrodownWriterTest >> exampleTextMultipleLinesWithNewLineBetween [
	^ 'Hello

Pharo'
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
	builder := MicMicrodownTextualBuilder on: String new writeStream

	
]

{ #category : #'tests - annotated' }
PRMicrodownWriterTest >> testAnnotated [
	"!!Note Pharo is cool and microdown too."
	
	self testWithInitialText: (builder rawAnnotated: 'Note' paragraph:  'Pharo is cool and microdown too'; contents).
	self assert: parsedBloc children first label equals: 'Note'.
]

{ #category : #'tests - annotated' }
PRMicrodownWriterTest >> testAnnotatedOnMultipleLines [

	self testWithInitialText: (builder rawAnnotated: 'Note' paragraph:  'Pharo is cool
and microdown too'; contents).
	self assert: parsedBloc children first label equals: 'Note'.
]

{ #category : #'tests - formatting' }
PRMicrodownWriterTest >> testBold [
	"**Hello Pharo**"
	
	self testWithInitialText: (builder rawParagraph: [ builder bold: self exampleText]; contents)
]

{ #category : #'tests - formatting' }
PRMicrodownWriterTest >> testBoldMultipleLines [
	"**Hello 
	Pharo**"
	
	self testWithInitialText: (builder rawParagraph: [ builder bold: self exampleTextMultipleLines] ; contents)
]

{ #category : #'tests - comments' }
PRMicrodownWriterTest >> testComment [
	"% Hello Pharo"
	
	self testWithInitialText: (builder comment: self exampleText; contents).
]

{ #category : #'tests - comments' }
PRMicrodownWriterTest >> testCommentOnMultipleLines [
	"% Hello 
	% Pharo"
	
	self testWithInitialText: (builder comment: self exampleTextMultipleLines ; contents)
]

{ #category : #'tests - external link' }
PRMicrodownWriterTest >> testExternalLink [
	"[Hello Pharo](url)"
	
	self testWithInitialText: (builder rawParagraph: [builder externalLink: '/url' withDescription: self exampleText]; contents)
]

{ #category : #'tests - figures' }
PRMicrodownWriterTest >> testFigure [
	"![Hello Pharo](url)"
	
	self testWithInitialText: (builder rawParagraph: [ builder figure: 'url' withDescription: self exampleText]; contents)
]

{ #category : #'tests - figures' }
PRMicrodownWriterTest >> testFigureWithArgument [
	"![Hello Pharo](url|label=fig&caption=This is a caption."
	self testWithInitialText: (builder rawParagraph: [ builder figure: 'url|label=fig1&caption=This is **a** caption.&width=80' withDescription: self exampleText] ; contents)
]

{ #category : #'tests - figures' }
PRMicrodownWriterTest >> testFigureWithArgumentContainingFormatting [
	"![Hello Pharo](url|label=fig&caption=This is a caption and it can contain **bol** but also `code`."
	self testWithInitialText: (builder rawParagraph: [ (builder figure: 'url|label=fig&caption=This is a caption and it can contain **bol** but also `code`' withDescription: self exampleText) ]; contents)
]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeader [
	"# Hello Pharo"
	| text |
	text := (builder header: [:b |  b text: self exampleText] withLevel: 1; contents).
	self assert: ('*Pharo*' match: text). 
	self testWithInitialText: text
]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeaderLvl3 [
	"### Hello Pharo"
	
	self testWithInitialText: (builder header: [:b |  b text: self exampleText] withLevel: 3; contents)

]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeaderWithBold [
	"# Hello **Pharo** is cool"

	self testWithInitialText: (builder 
							header: [ :b | b text: 'Hello '.
											 b bold: 'Pharo'.
											 b text: ' is cool'] 
							withLevel: 1;					
							contents)
]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeaderWithCode [
	"# Hello `Pharo` is cool"
	
	self testWithInitialText: (builder 
							header: [ :b | b text: 'Hello '.
											 b monospace: 'Pharo'.
											 b text: ' is cool']  withLevel: 1;				
							contents)
]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeaderWithExternalLink [
	"# Hello [Pharo](http://pharo.org) is cool"
	
	self testWithInitialText: (builder header: [ :b | b text: 'Hello '.
											 b externalLink: 'http://pharo.org/' withDescription: 'Pharo'.
											 b text: ' is cool'] 
										withLevel: 1;			
							contents)
]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeaderWithItalic [
	"# Hello _Pharo_ is cool"
	
	self testWithInitialText: (builder 
							header: [ :b | b text: 'Hello '.
											 b italic: 'Pharo'.
											 b text: ' is cool']  withLevel: 1;				
							contents)
]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeaderWithStrike [
	"# Hello ~Pharo~ is cool"

	self testWithInitialText: (builder 
							header: [ :b | b text: 'Hello '.
											 b strike: 'Pharo'.
											 b text: ' is cool']  withLevel: 1;				
							contents)
]

{ #category : #'tests - horizontal line' }
PRMicrodownWriterTest >> testHorizontalLine [
	"***"
	
	self testWithInitialText: (builder horizontalLine; contents)
]

{ #category : #'tests - horizontal line' }
PRMicrodownWriterTest >> testHorizontalLineWithIgnoredText [
	"*** kjlkjkljkl"

	initialText := (builder raw: self parser horizontalLineMarkup; space; raw: 'Blblblbl'; contents).
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: self parser horizontalLineMarkup, String cr.
	
]

{ #category : #'tests - internal link' }
PRMicrodownWriterTest >> testInternalLink [
	"*@fig1*"
	
	self testWithInitialText: (builder rawParagraph: [ builder internalLink: 'fig1' ]; contents)
]

{ #category : #'tests - formatting' }
PRMicrodownWriterTest >> testItalic [
	"_Hello Pharo_"
	
	self testWithInitialText: (builder rawParagraph: [ builder italic: self exampleText] ; contents)
]

{ #category : #'tests - formatting' }
PRMicrodownWriterTest >> testItalicMultipleLines [
	"_Hello
	Pharo_"
	
	self testWithInitialText: (builder rawParagraph: [ builder italic: self exampleTextMultipleLines]; contents)
]

{ #category : #'tests - meta data' }
PRMicrodownWriterTest >> testMetaData [
	
	| mictext |
	'{ 
	"authors": "S. Ducasse", "title" : "Pharo by Example" 
	}'.
	mictext := (builder metaDataFromAssociations: { 'authors' -> 'S. Ducasse' .  'title' -> 'Pharo by Example' };
		contents).
	self testWithInitialText: mictext.
	self assert: ('*authors*' match: mictext)
	
]

{ #category : #'tests - meta data' }
PRMicrodownWriterTest >> testMetaData2 [
	
	| mictext |
	'{ 
	"authors": "S. Ducasse"
	}'.
	mictext := (builder metaDataFromAssociations: { 'authors' -> 'S. Ducasse' };
		contents).
	self testWithInitialText: mictext.
	self assert: ('*authors*' match: mictext)
	
]

{ #category : #'tests - meta data' }
PRMicrodownWriterTest >> testMetaData3 [
	
	| mictext |
	'{ 
	"authors": "S. Ducasse"
	}'.
	mictext := (builder metaDataFromAssociations: { 'authors' -> 'S. Ducasse' };
		contents).
	self testWithInitialText: mictext.
	self assert: ('*authors*' match: mictext)
	
]

{ #category : #'tests - formatting' }
PRMicrodownWriterTest >> testMonospace [
	"`Hello Pharo`"
	
	self testWithInitialText: (builder rawParagraph: [ builder monospace: self exampleText]; contents)
]

{ #category : #'tests - formatting' }
PRMicrodownWriterTest >> testMonospaceMultipleLines [
	"`Hello
	Pharo`"
	
	self testWithInitialText: (builder rawParagraph: [ builder monospace: self exampleTextMultipleLines] ; contents)
]

{ #category : #'tests - list' }
PRMicrodownWriterTest >> testNestedUnorderedList [
	"- Hello
	- Pharo"
	| mictext |
	mictext := (builder unorderedListDuring: [ 
					builder item: [ builder text: 'Level 1' ].
					builder unorderedListDuring: [ 
								builder item: [ builder text: 'Level 2 1' ].
								builder item: [ builder text: 'Level 2 2' ] ] .
					builder item: [ builder text: 'Microdown item list' ]];
		contents).
	self testWithInitialText: mictext.
	self assert: mictext equals: '- Level 1
  - Level 2 1
  - Level 2 2
- Microdown item list
'.
	
]

{ #category : #'tests - paragraph' }
PRMicrodownWriterTest >> testOneParagraph [

	self testWithInitialText: (builder rawParagraph: [ builder text: 'Pharo is super cool']; contents)
]

{ #category : #'tests - paragraph' }
PRMicrodownWriterTest >> testOneParagraphWithAdorment [
	"**Pharo** is `COOL`"

	self testWithInitialText: (builder rawParagraph: [ builder bold: 'Microdown'; text: ' is '; monospace: 'COOL' ]; contents)
]

{ #category : #'tests - list' }
PRMicrodownWriterTest >> testOrderedList [
	"- Hello
	- Pharo"
	| mictext |
	mictext := (builder orderedListDuring: [
		builder orderedItem: [ builder text: 'Hello' ].
		builder orderedItem: [ builder text: 'Beautiful' ].
		builder orderedItem: [ builder text: 'Microdown item list' ]];
		contents).
	self testWithInitialText: mictext.
	self assert: (mictext occurrencesOf: $.) equals: 3
	
]

{ #category : #'tests - list' }
PRMicrodownWriterTest >> testOrderedListWithFormat [
	"1. **Hello**
	2. Pharo"
	
	| mictext |
	mictext := (builder orderedListDuring: [
						builder orderedItem: [ builder bold: 'Hello'; space; text: 'beautiful' ].
						builder orderedItem: [ builder text: 'Pharo' ] ] ;
						contents).
	self testWithInitialText: mictext.
	self assert: (mictext occurrencesOf: $.) equals: 2
]

{ #category : #'tests - quote block' }
PRMicrodownWriterTest >> testQuoteBlock [
	"> Hello Pharo"
	
	self testWithInitialText: (builder quoteBlock: self exampleText; contents)
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
	self testWithInitialText: (builder quoteBlock: self exampleText; newLine; quoteBlock: self exampleText ; contents)
]

{ #category : #'tests - quote block' }
PRMicrodownWriterTest >> testQuoteBlockOnMultipleLinesWithFormatting [
	"> Hello Pharo"
	"to be changed explicit use of ** should only for testing strange human edition"
	self skip.
	self testWithInitialText: (builder quoteBlock: 'hello **bold**'; newLine; quoteBlock: self exampleText ; contents)
	"MicInlineSplitter new start: parsedBloc children first text"	

	"MicInlineSplitter new start: 'hello **bold**', String cr, 'Pharo'
	ne garde pas les sauts de ligne.
	Donc cela veut dire que pour les lignes qui ne sont pas des paragraphes et que l'on veut garder comme
	telles on ne peut pas avoir des formatting qui debutent et finissent sur deux lignes.
	"
]

{ #category : #'tests - code block' }
PRMicrodownWriterTest >> testSimpleCodeBlock [
	"```
	Hello
	Pharo
	```"
	
	self testWithInitialText: (builder codeblock: self exampleTextMultipleLines ; contents)
]

{ #category : #'tests - formatting' }
PRMicrodownWriterTest >> testStrike [
	"~Hello Pharo~"
	
	self testWithInitialText: (builder rawParagraph: [ builder strike: self exampleText]; contents)
]

{ #category : #'tests - formatting' }
PRMicrodownWriterTest >> testStrikeMultipleLines [
	"~Hello
	Pharo~"
	
	self testWithInitialText: (builder rawParagraph: [ builder strike: self exampleTextMultipleLines]; contents)
]

{ #category : #'tests - paragraph' }
PRMicrodownWriterTest >> testTwoParagraphs [
	"Hello
	
	Pharo"
	self testWithInitialText: (builder rawParagraph: [builder text: 'hello'] ; newLine;
												rawParagraph: [ builder text: 'Pharo' ] ; contents)
]

{ #category : #'tests - list' }
PRMicrodownWriterTest >> testUnorderedList [
	"- Hello
	- Pharo"
	| mictext |
	mictext := (builder unorderedListDuring: [ 
		builder item: [ builder text: 'Hello' ].
		builder item: [ builder text: 'Beautiful' ].
		builder item: [ builder text: 'Microdown item list' ]];
		contents).
	self testWithInitialText: mictext.
	self assert: (mictext occurrencesOf: $-) equals: 3
	
]

{ #category : #'tests - list' }
PRMicrodownWriterTest >> testUnorderedListWithFormat [
	"- **Hello**
	- Pharo"
	
	| mictext |
	mictext := (builder unorderedListDuring: [
						builder item: [ builder bold: 'Hello'; space; text: 'beautiful...' ].
						builder item: [ builder text: 'Pharo' ] ] ;
						contents).
	self testWithInitialText: mictext.
	self assert: (mictext occurrencesOf: $-) equals: 2
]

{ #category : #running }
PRMicrodownWriterTest >> testWithInitialText: expectedString [
	
	parsedBloc := self parser parse: expectedString readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: expectedString equals: writtenText.
	
]

{ #category : #accessing }
PRMicrodownWriterTest >> writer [
	^ writer
]
