Class {
	#name : 'MicMicrodownObjectToPillarObjectConverterTest',
	#superclass : 'TestCase',
	#instVars : [
		'pillarDocument',
		'visitor',
		'factory'
	],
	#category : 'Pillar-MicrodownToPillarConverter-Tests',
	#package : 'Pillar-MicrodownToPillarConverter',
	#tag : 'Tests'
}

{ #category : 'parsing' }
MicMicrodownObjectToPillarObjectConverterTest >> parse: sample createChildElementOfClass: aClass [

	| parser micDoc pillarDoc |
	parser := self parserClass new. 
	micDoc := (parser parse: sample) children first children first.
	pillarDoc := micDoc accept: visitor.
	self assert: pillarDoc class equals: aClass.
	^ pillarDoc
]

{ #category : 'parsing' }
MicMicrodownObjectToPillarObjectConverterTest >> parse: sample createChildSecondElementOfClass: aClass [

	| parser micDoc pillarDoc |
	parser := self parserClass new. 
	micDoc := (parser parse: sample) children first children second.
	pillarDoc := micDoc accept: visitor.
	self assert: pillarDoc class equals: aClass.
	^ pillarDoc
]

{ #category : 'parsing' }
MicMicrodownObjectToPillarObjectConverterTest >> parse: sample createElementOfClass: aClass [

	| parser micDoc pillarDoc |
	parser := self parserClass new. 
	micDoc := (parser parse: sample) children first.
	pillarDoc := micDoc accept: visitor.
	self assert: pillarDoc class equals: aClass.
	^ pillarDoc
]

{ #category : 'tests' }
MicMicrodownObjectToPillarObjectConverterTest >> parserClass [
	^ Microdown
]

{ #category : 'running' }
MicMicrodownObjectToPillarObjectConverterTest >> setUp [
 	super setUp.
 	visitor := MicMicrodownObjectToPillarObjectConverter new.
	factory := MicMicrodownSnippetFactory new.
]

{ #category : 'tests' }
MicMicrodownObjectToPillarObjectConverterTest >> testAnchorBlock [
	self parse: factory anchorSample createElementOfClass: PRAnchor
]

{ #category : 'tests-inline blocks' }
MicMicrodownObjectToPillarObjectConverterTest >> testAnchorReference [
	self parse: factory anchorReferenceSample createChildElementOfClass: PRInternalLink
]

{ #category : 'tests' }
MicMicrodownObjectToPillarObjectConverterTest >> testAnnotated [
	self parse: factory annotatedSample createElementOfClass: PRAnnotatedParagraph
]

{ #category : 'tests-inline blocks' }
MicMicrodownObjectToPillarObjectConverterTest >> testAnnotation [
	self parse: factory annotationSample createChildSecondElementOfClass: PRUndefinedAnnotation
]

{ #category : 'tests-inline blocks' }
MicMicrodownObjectToPillarObjectConverterTest >> testBoldFormat [
	self parse: factory boldFormatSample createChildElementOfClass: PRBoldFormat
]

{ #category : 'tests-inline blocks' }
MicMicrodownObjectToPillarObjectConverterTest >> testBoldFormatEmpty [
	| boldBlock |
	self skip.
	self flag: #fixme.
	"the parser parse '****' and return a HorizontalBlock"
	boldBlock := self parse: factory boldFormatEmptySample createChildElementOfClass: PRBoldFormat.
	self assert: boldBlock text equals: ''
]

{ #category : 'tests' }
MicMicrodownObjectToPillarObjectConverterTest >> testCodeBlock [
	self parse: (factory codeblock: 'language=pharo' body: '1-2 ') createElementOfClass: PRCodeblock

]

{ #category : 'tests' }
MicMicrodownObjectToPillarObjectConverterTest >> testCodeInText [

	| document |
	document := self parserClass new parse: 'The method `foo` is fun'.
	pillarDocument := document accept: visitor.
	self assert: pillarDocument children first class equals: PRParagraph.
	self assert: pillarDocument children first children second class equals: PRMonospaceFormat 
	
	
]

{ #category : 'tests' }
MicMicrodownObjectToPillarObjectConverterTest >> testComment [
	self parse: factory commentSample createElementOfClass: PRCommentedLine
]

{ #category : 'tests' }
MicMicrodownObjectToPillarObjectConverterTest >> testEnvironmentBlock [

	self parse: factory environmentSample createElementOfClass: PREnvironment
	
]

{ #category : 'tests-inline blocks' }
MicMicrodownObjectToPillarObjectConverterTest >> testFigure [
	self parse: factory figureSample createChildElementOfClass: PRFigure
]

{ #category : 'tests' }
MicMicrodownObjectToPillarObjectConverterTest >> testHeader [ 
	self parse: factory headerLevel3Sample createElementOfClass: PRHeader
]

{ #category : 'tests' }
MicMicrodownObjectToPillarObjectConverterTest >> testHorizontalLineBlock [
	self parse: factory horizontalLineSample createElementOfClass: PRHorizontalRule
	
]

{ #category : 'tests-inline blocks' }
MicMicrodownObjectToPillarObjectConverterTest >> testItalicFormat [
	self parse: factory italicFormatSample createChildElementOfClass: PRItalicFormat
]

{ #category : 'tests-inline blocks' }
MicMicrodownObjectToPillarObjectConverterTest >> testItalicFormatEmpty [
	| italicBlock |
	italicBlock := self parse: factory italicFormatEmptySample createChildElementOfClass: PRItalicFormat.
	self assert: italicBlock text equals: ''
]

{ #category : 'tests-inline blocks' }
MicMicrodownObjectToPillarObjectConverterTest >> testLink [
	self parse: factory linkSample createChildElementOfClass: PRExternalLink
]

{ #category : 'tests' }
MicMicrodownObjectToPillarObjectConverterTest >> testListItem [
	self parse: factory listMultiSample createChildElementOfClass: PRListItem
	
]

{ #category : 'tests' }
MicMicrodownObjectToPillarObjectConverterTest >> testMathBlock [
	self parse: factory mathParametersSample createElementOfClass: PRMathEnvironment
	
]

{ #category : 'tests-inline blocks' }
MicMicrodownObjectToPillarObjectConverterTest >> testMathInline [
	self parse: factory mathInlineSample createChildElementOfClass: PRMathInTextAnnotation
]

{ #category : 'tests' }
MicMicrodownObjectToPillarObjectConverterTest >> testMetaDataBlock [
	self parse: factory metaDataSample createElementOfClass: PRMetadata
	
]

{ #category : 'tests-inline blocks' }
MicMicrodownObjectToPillarObjectConverterTest >> testMonospaceFormat [
	self parse: factory monospaceFormatSample createChildElementOfClass: PRMonospaceFormat
]

{ #category : 'tests-inline blocks' }
MicMicrodownObjectToPillarObjectConverterTest >> testMonospaceFormatEmpty [
	| monospaceBloc |
	monospaceBloc := self parse: factory monospaceFormatEmptySample createChildElementOfClass: PRMonospaceFormat.
	self assert: monospaceBloc text equals: ''
]

{ #category : 'tests' }
MicMicrodownObjectToPillarObjectConverterTest >> testNumberedList [
	| document |
	document := (self parserClass new 
		parse: MicMicrodownSnippetFactory new orderedListWithTwoItemsSample).
	document := document accept: visitor.
	self assert: document children first class equals: PROrderedList.
	self
		assert: document children first children first class
		equals: PRListItem.
	self
		assert: document children first children second class
		equals: PRListItem
]

{ #category : 'tests' }
MicMicrodownObjectToPillarObjectConverterTest >> testQuoteBlock [
	| source root pillarNode |
	source := '> text1
>    text2'.
	root := self parserClass new parse: source.
	self assert: root children size equals: 1.
	pillarNode := root children first accept: visitor.
	self assert: pillarNode class equals: PRPreformatted.
	self
		assert: pillarNode text
		equals:
			'text1
text2'
]

{ #category : 'tests-inline blocks' }
MicMicrodownObjectToPillarObjectConverterTest >> testRawFormat [
	self skip.
	self flag: #fixme.
	"PRRaw don't understand setChildren"
	self parse: factory rawFormatSample createChildSecondElementOfClass: PRRaw
]

{ #category : 'tests' }
MicMicrodownObjectToPillarObjectConverterTest >> testRoot [
	| source root pillar |
	source := '####    Level four
## Level 2'.
	root := self parserClass new parse: source.
	pillar := root accept: visitor.
	self assert: pillar class equals: PRDocument.
	self assert: pillar children second class equals: PRHeader.
	self assert: pillar children first level equals: 4
]

{ #category : 'tests' }
MicMicrodownObjectToPillarObjectConverterTest >> testSingleLevelOrderedList2 [
	| source root list |
	source := '19. item 1
    expanded
7.  item 2'.
	root := self parserClass new parse: source.
	list := root children first accept: visitor.
	self assert: list class equals: PROrderedList .
	self assert: list children size equals: 2.
	self
		assert: list children first text
		equals:
			'item 1
expanded'.
	self assert: list counter equals: 19
]

{ #category : 'tests' }
MicMicrodownObjectToPillarObjectConverterTest >> testSingleLevelUnorderedList2 [
	| source root list item |
	source := '- item 1
  expanded
- item 2'.
	root := self parserClass new parse: source.
	list := root children first accept: visitor.
	self assert: list class equals: PRUnorderedList.
	self assert: list children size equals: 2.
	item := list children first.
	self assert: item class equals: PRListItem.
	self
		assert: item children first text
		equals:
			'item 1
expanded'
]

{ #category : 'tests' }
MicMicrodownObjectToPillarObjectConverterTest >> testSingleParagraphWithIndentedText [
	| source root expected pillar |
	source := 'This is
   a paragraph with spaces
	and one with tabs'.
	expected := 'This is
a paragraph with spaces
and one with tabs'.
	root := self parserClass new parse: source.
	pillar := root children first accept: visitor.
	self assert: pillar class equals: PRParagraph.
	self assert: pillar children first class equals: PRText.
	self assert: pillar children first text equals: expected
]

{ #category : 'tests-inline blocks' }
MicMicrodownObjectToPillarObjectConverterTest >> testStrikethroughFormat [
	self parse: factory strikethroughFormatSample createChildElementOfClass: PRStrikethroughFormat
]

{ #category : 'tests-inline blocks' }
MicMicrodownObjectToPillarObjectConverterTest >> testStrikethroughFormatEmpty [
	| strikeBlock |
	strikeBlock := self parse: factory strikethroughFormatEmptySample createChildElementOfClass: PRStrikethroughFormat.
	self assert: strikeBlock text equals: ''
]

{ #category : 'tests' }
MicMicrodownObjectToPillarObjectConverterTest >> testTableBlock [

	self parse: factory simpleTable createElementOfClass: PRTable
]

{ #category : 'tests' }
MicMicrodownObjectToPillarObjectConverterTest >> testTableFormatBlock [

	self parse: factory simpleTableMoreFormat createElementOfClass: PRTable
]

{ #category : 'tests-inline blocks' }
MicMicrodownObjectToPillarObjectConverterTest >> testText [
	| source root pillar |
	source := 'Foo'.
	root := (self parserClass new parse: source) children first children first.
	pillar := root accept: visitor.
	self assert: pillar class equals: PRText
]

{ #category : 'tests' }
MicMicrodownObjectToPillarObjectConverterTest >> testTwoLevelUnorderedList1 [
	| source root list secondItem subItem |
	source := '- item 1
  - sublevel
- item 2'.
	root := self parserClass new parse: source.
	list := root children first accept: visitor.
	secondItem := list children second.
	self assert: secondItem class equals: PRListItem.
	self assert: secondItem children first class equals: PRText.
	self assert: secondItem children first text equals: 'item 2'.
	subItem := list children first children second.
	self assert: subItem class equals: PRUnorderedList.
	self
		assert: subItem children first text
		equals: 'sublevel'	"item 1"	"unorded list"	"sub item"
]
