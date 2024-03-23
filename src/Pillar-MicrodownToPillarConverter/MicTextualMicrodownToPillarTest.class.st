"
This test case uses the microdownSnippetFactory and test that the conversion to Pillar object trees is correct. 
This is why it is in this package

Microdown text -> Microdown trees -> Pillar trees

Te tests are just checking that object of the correct class is created. 
Future extensions should handle the details.
"
Class {
	#name : 'MicTextualMicrodownToPillarTest',
	#superclass : 'TestCase',
	#instVars : [
		'factory'
	],
	#category : 'Pillar-MicrodownToPillarConverter-Tests',
	#package : 'Pillar-MicrodownToPillarConverter',
	#tag : 'Tests'
}

{ #category : 'tests - anchor' }
MicTextualMicrodownToPillarTest >> anchorClass [

	^ PRAnchor
]

{ #category : 'tests - codeblock' }
MicTextualMicrodownToPillarTest >> codeBlockClass [
	^ PRCodeblock
]

{ #category : 'accessing' }
MicTextualMicrodownToPillarTest >> factory [

	^ factory
]

{ #category : 'accessing' }
MicTextualMicrodownToPillarTest >> factory: aFactory [

	factory := aFactory
]

{ #category : 'tests - header' }
MicTextualMicrodownToPillarTest >> headerClass [
	^ PRHeader
]

{ #category : 'tests - list' }
MicTextualMicrodownToPillarTest >> orderedListClass [
	^ PROrderedList
]

{ #category : 'accessing' }
MicTextualMicrodownToPillarTest >> parse: sample createChildElementOfClass: aClass [

	| parser micDoc pillarDoc |
	parser := self parserClass new. 
	micDoc := parser parse: sample.
	pillarDoc := micDoc asPillar.
	self assert: pillarDoc children first children first class equals: aClass.
	^ pillarDoc children first children first
]

{ #category : 'accessing' }
MicTextualMicrodownToPillarTest >> parse: sample createElementOfClass: aClass [

	| parser micDoc pillarDoc |
	parser := self parserClass new. 
	micDoc := parser parse: sample.
	pillarDoc := micDoc asPillar.
	self assert: pillarDoc children first class equals: aClass.
]

{ #category : 'accessing' }
MicTextualMicrodownToPillarTest >> parseCreateDocument: sample [ 

	| parser micDoc pillarDoc |
	parser := self parserClass new. 
	micDoc := parser parse: sample.
	pillarDoc := micDoc asPillar.
	self assert: pillarDoc class equals: PRDocument.
]

{ #category : 'accessing' }
MicTextualMicrodownToPillarTest >> parserClass [
	^ Microdown   
]

{ #category : 'tests - document' }
MicTextualMicrodownToPillarTest >> rootBlockClass [

	^ PRDocument
]

{ #category : 'running' }
MicTextualMicrodownToPillarTest >> setUp [ 
	super setUp.
	self factory: MicMicrodownSnippetFactory new.
]

{ #category : 'tests - anchor' }
MicTextualMicrodownToPillarTest >> testAnchor [
	self parse: factory anchorSample createElementOfClass: self anchorClass
]

{ #category : 'tests - anchor' }
MicTextualMicrodownToPillarTest >> testAnchorAreTrimed [
	self parse: factory anchorAreTrimedSample createElementOfClass: self anchorClass
]

{ #category : 'tests - anchor' }
MicTextualMicrodownToPillarTest >> testAnchorWithNewLine [
	self parse: factory anchorWithNewLineSample createElementOfClass:  self anchorClass
]

{ #category : 'tests - anchor' }
MicTextualMicrodownToPillarTest >> testAnchorWithSpaceInside [
	self parse: factory anchorWithSpaceInsideSample createElementOfClass:  self anchorClass
]

{ #category : 'tests - format' }
MicTextualMicrodownToPillarTest >> testBoldFormat [
	self parse: factory boldFormatSample createChildElementOfClass: PRBoldFormat
]

{ #category : 'tests - format' }
MicTextualMicrodownToPillarTest >> testBoldFormatEmpty [
	| boldBlock |
	self skip.
	"the parser parse '****' and return a HorizontalBlock"
	boldBlock := self parse: factory boldFormatEmptySample createChildElementOfClass: PRBoldFormat.
	self assert: boldBlock text equals: ''
]

{ #category : 'tests - header' }
MicTextualMicrodownToPillarTest >> testHeaderEmpty [
	self parse: factory headerEmptySample createElementOfClass: self headerClass
]

{ #category : 'tests - header' }
MicTextualMicrodownToPillarTest >> testHeaderLevel1 [
	self parse: factory headerLevel1Sample createElementOfClass: self headerClass
]

{ #category : 'tests - header' }
MicTextualMicrodownToPillarTest >> testHeaderLevel2 [
	self parse: factory headerLevel2Sample createElementOfClass: self headerClass
]

{ #category : 'tests - header' }
MicTextualMicrodownToPillarTest >> testHeaderLevel3 [
	self parse: factory headerLevel3Sample createElementOfClass: self headerClass
]

{ #category : 'tests - header' }
MicTextualMicrodownToPillarTest >> testHeaderLevel4 [
	self parse: factory headerLevel4Sample createElementOfClass: self headerClass
]

{ #category : 'tests - header' }
MicTextualMicrodownToPillarTest >> testHeaderLevel5 [
	self parse: factory headerLevel5Sample createElementOfClass: self headerClass
]

{ #category : 'tests - header' }
MicTextualMicrodownToPillarTest >> testHeaderWithFormat [
	self parse: factory headerWithFormatSample createElementOfClass: self headerClass
]

{ #category : 'tests - header' }
MicTextualMicrodownToPillarTest >> testHeaderWithNewLine [
	self parse: factory headerWithNewLineSample createElementOfClass: self headerClass
]

{ #category : 'tests - format' }
MicTextualMicrodownToPillarTest >> testItalicFormat [
	self parse: factory italicFormatSample createChildElementOfClass: PRItalicFormat
]

{ #category : 'tests - format' }
MicTextualMicrodownToPillarTest >> testItalicFormatEmpty [
	| italicBlock |
	italicBlock := self parse: factory italicFormatEmptySample createChildElementOfClass: PRItalicFormat.
	self assert: italicBlock text equals: ''
]

{ #category : 'tests - document' }
MicTextualMicrodownToPillarTest >> testLineEnd [
	self parseCreateDocument: factory lineEndSample 
]

{ #category : 'tests - document' }
MicTextualMicrodownToPillarTest >> testLineEndwithNewline [
	self parseCreateDocument: factory lineEndwithNewlineSample 
]

{ #category : 'tests - list' }
MicTextualMicrodownToPillarTest >> testListMulti [
	self parse: factory listMultiSample createElementOfClass: self unorderedListClass
]

{ #category : 'tests - list' }
MicTextualMicrodownToPillarTest >> testListWithComment [
	self parse: factory listWithCommentSample createElementOfClass: self orderedListClass 
]

{ #category : 'tests - format' }
MicTextualMicrodownToPillarTest >> testMonospaceFormat [
	self parse: factory monospaceFormatSample createChildElementOfClass: PRMonospaceFormat
]

{ #category : 'tests - format' }
MicTextualMicrodownToPillarTest >> testMonospaceFormatEmpty [
	| monospaceBloc |
	monospaceBloc := self parse: factory monospaceFormatEmptySample createChildElementOfClass: PRMonospaceFormat.
	self assert: monospaceBloc text equals: ''
]

{ #category : 'tests - document' }
MicTextualMicrodownToPillarTest >> testNewline [
	self parseCreateDocument: factory newlineSample 
]

{ #category : 'tests - document' }
MicTextualMicrodownToPillarTest >> testNewlineCR [
	self parseCreateDocument: factory newlineCRSample 
]

{ #category : 'tests - document' }
MicTextualMicrodownToPillarTest >> testNewlineCRLF [
	self parseCreateDocument: factory newlineCRLFSample 
]

{ #category : 'tests - document' }
MicTextualMicrodownToPillarTest >> testNewlineLF [
	self parseCreateDocument: factory newlineLFSample 
]

{ #category : 'tests - list' }
MicTextualMicrodownToPillarTest >> testOrderedList [
	self parse: factory orderedListSample createElementOfClass: self orderedListClass
]

{ #category : 'tests - list' }
MicTextualMicrodownToPillarTest >> testOrderedListEmpty [
	self parse: factory orderedListEmptySample createElementOfClass: self orderedListClass
]

{ #category : 'tests - list' }
MicTextualMicrodownToPillarTest >> testOrderedListWithTwoItems [
	self
		parse: factory orderedListWithTwoItemsSample
		createElementOfClass: self orderedListClass
]

{ #category : 'tests - codeblock' }
MicTextualMicrodownToPillarTest >> testScript [
	self
		parse: factory blockSampleOnMultipleLines
		createElementOfClass: self codeBlockClass
]

{ #category : 'tests - codeblock' }
MicTextualMicrodownToPillarTest >> testScriptParameterTrueByDefault [
	self 
		parse: factory blockWithParameterTrueByDefaultSample 
		createElementOfClass: self codeBlockClass 
]

{ #category : 'tests - codeblock' }
MicTextualMicrodownToPillarTest >> testScriptParameterWithFloat [
	self parse: factory blockWithParameterWithFloatSample createElementOfClass: self codeBlockClass 
]

{ #category : 'tests - codeblock' }
MicTextualMicrodownToPillarTest >> testScriptParameterWithNoValues [
	self parse: factory blockWithParameterWithNoValuesSample createElementOfClass: self codeBlockClass 
]

{ #category : 'tests - codeblock' }
MicTextualMicrodownToPillarTest >> testScriptWithLanguage [
	self parse: factory blockWithLanguageSample createElementOfClass: self codeBlockClass 
]

{ #category : 'tests - codeblock' }
MicTextualMicrodownToPillarTest >> testScriptWithNewLine [
	self parse: factory blockWithNewLineSample createElementOfClass: self codeBlockClass 
]

{ #category : 'tests - codeblock' }
MicTextualMicrodownToPillarTest >> testScriptWithSpaceAtTheEnd [
	self parse: factory blockWithSpaceAtTheEndSample createElementOfClass: self codeBlockClass 
]

{ #category : 'tests - codeblock' }
MicTextualMicrodownToPillarTest >> testScriptWithSpacedParameters [
	self parse: factory blockWithSpacedParametersSample createElementOfClass: self codeBlockClass
]

{ #category : 'tests - format' }
MicTextualMicrodownToPillarTest >> testStrikethroughFormat [
	self parse: factory strikethroughFormatSample createChildElementOfClass: PRStrikethroughFormat
]

{ #category : 'tests - format' }
MicTextualMicrodownToPillarTest >> testStrikethroughFormatEmpty [
	| strikeBlock |
	strikeBlock := self parse: factory strikethroughFormatEmptySample createChildElementOfClass: PRStrikethroughFormat.
	self assert: strikeBlock text equals: ''
]

{ #category : 'tests - list' }
MicTextualMicrodownToPillarTest >> testUnorderedList [
	self parse: factory unorderedListSample createElementOfClass: self unorderedListClass 
]

{ #category : 'tests - list' }
MicTextualMicrodownToPillarTest >> testUnorderedListEmpty [
	self parse: factory unorderedListEmptySample createElementOfClass: self unorderedListClass 
]

{ #category : 'tests - list' }
MicTextualMicrodownToPillarTest >> testUnorderedListWithSubList [
	self
		parse: factory unorderedListWithSubListSample
		createElementOfClass: self unorderedListClass 
]

{ #category : 'tests - list' }
MicTextualMicrodownToPillarTest >> testUnorderedListWithTwoItems [
	self
		parse: factory unorderedListWithTwoItemsSample
		createElementOfClass: self unorderedListClass 
]

{ #category : 'tests - list' }
MicTextualMicrodownToPillarTest >> unorderedListClass [

	^ PRUnorderedList 
]
