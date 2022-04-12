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
	#pools : [
		'MicroSharedPool'
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

{ #category : #'tests - anchor' }
PRMicrodownWriterTest >> testAnchor [
 	"!!Note Pharo is cool and microdown too."

 	self testWithInitialText: (builder anchor: 'Note'; contents).
 	self assert: parsedBloc children first label equals: 'Note'.
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
	self testWithInitialText: (builder rawParagraph: [ builder bold: [builder text: self exampleText]]; contents)
]

{ #category : #'tests - formatting' }
PRMicrodownWriterTest >> testBoldMultipleLines [
	"**Hello 
	Pharo**"
	
	self testWithInitialText: (builder rawParagraph: [ builder bold: [ builder text: self exampleTextMultipleLines]] ; contents)
]

{ #category : #'tests - code block' }
PRMicrodownWriterTest >> testCodeBlockCaptionContainsMonospace [

	"```language2=Pharo&caption=`Color` is cool
	Hello
	Pharo
	```"

	| mictext |
	mictext := builder
		           codeblock: self exampleTextMultipleLines
		           firstLineAssociations: { 
				           ('language2' -> 'Pharo').
				           ('caption' -> '`Color` is cool') };
		           contents.
	self testWithInitialText: mictext.
	self assert: ('*language*' match: mictext)
]

{ #category : #'tests - code block' }
PRMicrodownWriterTest >> testCodeBlockParametersWithValueTrue [
	"```
	Hello
	Pharo
	```"
	| pillar |
	pillar := PRPillarParser new parse: '[[[testcase=true
this is a code block
]]]'.
	self assert: (pillar accept: writer) contents equals: '```testcase=true
this is a code block
```
'
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

 	self testWithInitialText: (builder 
										rawParagraph: [builder externalLink: 'http://pharo.org/' 
											withDescription: [ builder text: self exampleText]]; contents)
]

{ #category : #'tests - external link' }
PRMicrodownWriterTest >> testExternalLinkWithMicroDownMarkup [

	"[Hello Pharo](url)"

	self testWithInitialText: (builder
			 rawParagraph: [ 
				 builder
					 externalLink: 'http://pharo.org/'
					 withDescription: [ builder text: 'Pharo \~is c\**ool' ] ];
			 contents)
]

{ #category : #'tests - figures' }
PRMicrodownWriterTest >> testFigure [
	"![Hello Pharo](http://www.pharo.org/foo.png)"
	self testWithInitialText: (builder 
		rawParagraph: [ builder 
								figureURLString: 'http://www.pharo.org/foo.png' 
								withCaption: [ builder text: self exampleText ]]; contents)
]

{ #category : #'tests - figures' }
PRMicrodownWriterTest >> testFigureWithArgument [

	self testWithInitialText: (builder
			 rawParagraph: [ 
				 builder
					 figureURLString: 'http://pharo.org/'
					 withCaption: [ builder text: self exampleText ]
					 withParameters: (OrderedDictionary new
							  at: 'label' put: 'fig1';
							  at: 'width' put: '80';
							  yourself) ];
			 contents)
]

{ #category : #'tests - figures' }
PRMicrodownWriterTest >> testFigureWithArgumentContainingFormatting [
	self testWithInitialText: (builder rawParagraph: [ (builder figureURLString: 'file:///url' 
																				  withCaption: [ builder rawParagraph: [builder text:'You can have '.
																																	builder bold: [ builder text: 'bold' ].	
																																	builder text: ' but also '.
																																	builder italic:	[builder text: 'italic']]]
																				  withParameters: {'label'->'fig' . 'size'->80 } asDictionary)]; contents)
]

{ #category : #'tests - figures' }
PRMicrodownWriterTest >> testFigureWithCaptionContainingFormatting [

	"![This is a caption and it can contain **bol** but also `code`.](http://pharo.org)"

	self skip.
	"Caption is duplicate"

	self testWithInitialText: (builder
			 rawParagraph: [ 
				 builder
					 figureURLString: 'http://pharo.org/light.png'
					 withCaption: [ 
						 builder
							 text: 'This is a caption and it can contain ';
							 bold: [ builder text: 'bol' ];
							 text: ' but also ';
							 monospace: [ builder text: '`code`' ] ] ];
			 contents)
]

{ #category : #'tests - figures' }
PRMicrodownWriterTest >> testFigureWithFileUrl [
	
	"![Hello Pharo](url?label=fig&caption=This is a caption."
	
	self testWithInitialText: 
		(builder rawParagraph: [ 
			builder 
				figureURLString: 'http://pharo.org/label=fig&width=120' 
				withCaption: [ builder text: self exampleText]] ; contents)
]

{ #category : #'tests - figures' }
PRMicrodownWriterTest >> testFigureWithMicroDownMarkup [

	self testWithInitialText: (builder
			 rawParagraph: [ 
				 builder
					 figureURLString: 'http://pharo.org/'
					 withCaption: [ builder text: 'Pharo \~is\_\**cool' ]
					 withParameters: (OrderedDictionary new
							  at: 'label' put: 'fig1';
							  at: 'width' put: '80';
							  yourself) ];
			 contents)
]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeader [

	"# Hello Pharo"

	| text |
	text := builder
		        header: [ builder text: self exampleText ] withLevel: 1;
		        contents.
	self assert: ('*Pharo*' match: text).
	self testWithInitialText: text
]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeaderLvl3 [
	"### Hello Pharo"
	
	self testWithInitialText: (builder header: [ builder text: self exampleText ] withLevel: 3; contents)

]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeaderWithBold [
	"# Hello **Pharo** is cool"

	self testWithInitialText: (builder 
							header: [ builder text: 'Hello ';
											 bold: [ builder text: 'Pharo'];
											 text: ' is cool'] 
							withLevel: 1;					
							contents)
]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeaderWithCode [
	"# Hello `Pharo` is cool"
	
	self testWithInitialText: (builder 
							header: [ builder text: 'Hello ';
											 monospace: 'Pharo';
											 text: ' is cool']  withLevel: 1;				
							contents)
]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeaderWithExternalLink [
	"# Hello [Pharo](http://pharo.org) is cool"
	
	self testWithInitialText: (builder 
										header: [ builder 
											text: 'Hello ';
											externalLink: 'http://pharo.org/' withDescription: [ builder text: 'Pharo' ];
											text: ' is cool'] 
										withLevel: 1;			
							contents)
]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeaderWithItalic [
	"# Hello _Pharo_ is cool"
	
	self testWithInitialText: (builder 
							header: [ builder 
											text: 'Hello ';
											italic: [ builder text: 'Pharo'];
											text: ' is cool']  withLevel: 1;				
							contents)
]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeaderWithMircroDownMarkup [

	"# Hello Pharo"

	| text |
	text := builder
		        header: [ builder text: 'Pharo \~is c\**ool' ] withLevel: 1;
		        contents.
	self assert: ('*Pharo*' match: text).
	self testWithInitialText: text
]

{ #category : #'tests - header' }
PRMicrodownWriterTest >> testHeaderWithStrike [
	"# Hello ~Pharo~ is cool"

	self testWithInitialText: (builder 
							header: [ builder 
											text: 'Hello ';
											strike: [ builder text: 'Pharo'];
											text: ' is cool']  withLevel: 1;				
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

	initialText := (builder raw: HorizontalLineMarkup; space; raw: 'Blblblbl'; contents).
	parsedBloc := self parser parse: initialText readStream.
	writtenText := self writer start: parsedBloc asPillar; contents.
	self assert: writtenText equals: HorizontalLineMarkup, String cr.
	
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

	self testWithInitialText: (builder rawParagraph: [ builder bold: [builder text:'Microdown']; text: ' is '; monospace: 'COOL' ]; contents)
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

{ #category : #'tests - list' }
PRMicrodownWriterTest >> testOrderedListWithMicroDownMarkup [

	"- Hello
	- Pharo"

	| mictext |
	mictext := builder
		           orderedListDuring: [ 
			           builder orderedItem: [ builder text: '\~Hello' ].
			           builder orderedItem: [ builder text: '\**Beautiful' ].
			           builder orderedItem: [ 
					           builder text: 'Microdown item list' ] ];
		           contents.
	self testWithInitialText: mictext.
	self assert: (mictext occurrencesOf: $.) equals: 3
]

{ #category : #tests }
PRMicrodownWriterTest >> testPRInputFileAnnotation [

	| pillar |
	pillar := PRPillarParser new parse:
		          '${inputFile:path=Chapters/Smacc/SmaccIntro.pillar}$

${inputFile:path=Chapters/Smacc/SmaccTutorial.pillar}$

${inputFile:path=Chapters/Smacc/SmaccScanner.pillar}$

${inputFile:path=Chapters/Smacc/SmaccParser.pillar}$'.
	self
		assert: (self writer start: pillar) contents
		equals: '<? inputFile: |path=Chapters/Smacc/SmaccIntro.pillar
?>

<? inputFile: |path=Chapters/Smacc/SmaccTutorial.pillar
?>

<? inputFile: |path=Chapters/Smacc/SmaccScanner.pillar
?>

<? inputFile: |path=Chapters/Smacc/SmaccParser.pillar
?>'
]

{ #category : #'tests - paragraph' }
PRMicrodownWriterTest >> testParagraphWithMicroDownMarkup [

	self testWithInitialText: (builder
			 rawParagraph: [ builder text: 'Pharo \_is su\~per c\**ool' ];
			 contents)
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

{ #category : #'tests - code block' }
PRMicrodownWriterTest >> testSimpleCodeBlockWithFirstTag [
	"```language=Pharo
	Hello
	Pharo
	```"
	| mictext |
	mictext := builder codeblock: self exampleTextMultipleLines firstLineAssociations: {'language' -> 'Pharo'} ; contents.
	self testWithInitialText: mictext.
	self assert: ('*language*' match: mictext) 
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

{ #category : #'tests - list' }
PRMicrodownWriterTest >> testUnorderedListWithMicroDownMarkup [

	"- Hello
	- Pharo"

	| mictext |
	mictext := builder
		           unorderedListDuring: [ 
			           builder item: [ builder text: '\~Hello' ].
			           builder item: [ builder text: '\**Beautiful' ].
			           builder item: [ builder text: 'Microdown item list' ] ];
		           contents.
	self testWithInitialText: mictext.
	self assert: (mictext occurrencesOf: $-) equals: 3
]

{ #category : #running }
PRMicrodownWriterTest >> testWithInitialText: expectedString [

	parsedBloc := self parser parse: expectedString readStream.
	writtenText := self writer
		               start: parsedBloc asPillar;
		               contents.
	self assert: expectedString equals: writtenText
]

{ #category : #accessing }
PRMicrodownWriterTest >> writer [
	^ writer
]
