"
This is not clear that forking also the PRPillarGrammarTest was a good idea. 
But let us start somewhere. 
"
Class {
	#name : #PRMicroDownGrammarTest,
	#superclass : #PP2CompositeNodeTest,
	#instVars : [
		'factory'
	],
	#category : #'Pillar-PetitMicroDown'
}

{ #category : #accessing }
PRMicroDownGrammarTest >> factory [

	^ factory
]

{ #category : #accessing }
PRMicroDownGrammarTest >> factory: aFactory [

	factory := aFactory
]

{ #category : #accessing }
PRMicroDownGrammarTest >> parserClass [
	^ PRMicroDownGrammar
]

{ #category : #running }
PRMicroDownGrammarTest >> setUp [ 
	super setUp.
	self factory: MicroDownSnippetFactory new.
]

{ #category : #'tests - anchor' }
PRMicroDownGrammarTest >> testAnchor [
	self parse: factory anchorSample rule: #anchor
]

{ #category : #'tests - anchor' }
PRMicroDownGrammarTest >> testAnchorAreTrimed [
	self parse: factory anchorAreTrimedSample rule: #anchor
]

{ #category : #'tests - anchor' }
PRMicroDownGrammarTest >> testAnchorWithNewLine [
	self parse: factory anchorWithNewLineSample rule: #elementWithNewline
]

{ #category : #'tests - anchor' }
PRMicroDownGrammarTest >> testAnchorWithSpaceInside [
	self parse: factory anchorWithSpaceInsideSample rule: #anchor
]

{ #category : #'tests - format' }
PRMicroDownGrammarTest >> testBoldFormat [
	self parse: factory boldFormatSample rule: #format
]

{ #category : #'tests - format' }
PRMicroDownGrammarTest >> testBoldFormatEmpty [
	self parse: factory boldFormatEmptySample rule: #format
]

{ #category : #'tests - header' }
PRMicroDownGrammarTest >> testHeaderEmpty [
	self parse: factory headerEmptySample rule: #header
]

{ #category : #'tests - header' }
PRMicroDownGrammarTest >> testHeaderLevel1 [
	self parse: factory headerLevel1Sample rule: #header
]

{ #category : #'tests - header' }
PRMicroDownGrammarTest >> testHeaderLevel2 [
	self parse: factory headerLevel2Sample rule: #header
]

{ #category : #'tests - header' }
PRMicroDownGrammarTest >> testHeaderLevel3 [
	self parse: factory headerLevel3Sample rule: #header
]

{ #category : #'tests - header' }
PRMicroDownGrammarTest >> testHeaderLevel4 [
	self parse: factory headerLevel4Sample rule: #header
]

{ #category : #'tests - header' }
PRMicroDownGrammarTest >> testHeaderLevel5 [
	self parse: factory headerLevel5Sample rule: #header
]

{ #category : #'tests - header' }
PRMicroDownGrammarTest >> testHeaderWithFormat [
	self parse: factory headerWithFormatSample rule: #header
]

{ #category : #'tests - header' }
PRMicroDownGrammarTest >> testHeaderWithNewLine [
	self parse: factory headerWithNewLineSample rule: #elementWithNewline
]

{ #category : #'tests - format' }
PRMicroDownGrammarTest >> testItalicFormat [
	self parse: factory italicFormatSample rule: #format
]

{ #category : #'tests - format' }
PRMicroDownGrammarTest >> testItalicFormatEmpty [
	self parse: factory italicFormatEmptySample rule: #format
]

{ #category : #'tests - document' }
PRMicroDownGrammarTest >> testLineEnd [
	self parse: factory lineEndSample rule: #lineEnd
]

{ #category : #'tests - document' }
PRMicroDownGrammarTest >> testLineEndwithNewline [
	self parse: factory lineEndwithNewlineSample rule: #lineEnd
]

{ #category : #'tests - list' }
PRMicroDownGrammarTest >> testListMulti [
	self parse: factory listMultiSample rule: #lists
]

{ #category : #'tests - list' }
PRMicroDownGrammarTest >> testListWithComment [
	self parse: factory listWithCommentSample rule: #list
]

{ #category : #'tests - format' }
PRMicroDownGrammarTest >> testMonospaceFormat [
	self parse: factory monospaceFormatSample rule: #format
]

{ #category : #'tests - format' }
PRMicroDownGrammarTest >> testMonospaceFormatEmpty [
	self parse: factory monospaceFormatEmptySample rule: #format
]

{ #category : #'tests - document' }
PRMicroDownGrammarTest >> testNewline [
	self parse: factory newlineSample rule: #newline
]

{ #category : #'tests - document' }
PRMicroDownGrammarTest >> testNewlineCR [
	self parse: factory newlineCRSample rule: #newline
]

{ #category : #'tests - document' }
PRMicroDownGrammarTest >> testNewlineCRLF [
	self parse: factory newlineCRLFSample rule: #newline
]

{ #category : #'tests - document' }
PRMicroDownGrammarTest >> testNewlineLF [
	self parse: factory newlineLFSample rule: #newline
]

{ #category : #'tests - list' }
PRMicroDownGrammarTest >> testOrderedList [
	self parse: factory orderedListSample rule: #orderedList
]

{ #category : #'tests - list' }
PRMicroDownGrammarTest >> testOrderedListEmpty [
	self parse: factory orderedListEmptySample rule: #orderedList
]

{ #category : #'tests - list' }
PRMicroDownGrammarTest >> testOrderedListWithTwoItems [
	self
		parse: factory orderedListWithTwoItemsSample
		rule: #orderedList
]

{ #category : #'tests - codeblock' }
PRMicroDownGrammarTest >> testScript [
	self parse: factory scriptSample rule: #script
]

{ #category : #'tests - codeblock' }
PRMicroDownGrammarTest >> testScriptParameter [
	self
		parse: factory scriptParameterSample
		rule: #parameterUntilNewline
]

{ #category : #'tests - codeblock' }
PRMicroDownGrammarTest >> testScriptParameterEscape [
	self
		parse: factory scriptParameterEscapeSample
		rule: #parameterUntilNewline
]

{ #category : #'tests - codeblock' }
PRMicroDownGrammarTest >> testScriptParameterTrueByDefault [
	self 
		parse: factory scriptParameterTrueByDefaultSample 
		rule: #script
]

{ #category : #'tests - codeblock' }
PRMicroDownGrammarTest >> testScriptParameterValue [
	self
		parse: factory scriptParameterValueSample
		rule: #parameterValueUntilNewline
]

{ #category : #'tests - codeblock' }
PRMicroDownGrammarTest >> testScriptParameterWithFloat [
	self parse: factory scriptParameterWithFloatSample rule: #script
]

{ #category : #'tests - codeblock' }
PRMicroDownGrammarTest >> testScriptParameterWithNoValues [
	self parse: factory scriptParameterWithNoValuesSample rule: #script
]

{ #category : #'tests - codeblock' }
PRMicroDownGrammarTest >> testScriptParameterWithSpacesBeforeAndAfter [
	self
		parse: factory scriptParameterWithSpacesBeforeAndAfterSample
		rule: #scriptParameters
]

{ #category : #'tests - codeblock' }
PRMicroDownGrammarTest >> testScriptParameterWithoutValue [
	self
		parse: factory scriptParameterWithoutValueSample
		rule: #parameterUntilNewline
]

{ #category : #'tests - codeblock' }
PRMicroDownGrammarTest >> testScriptParameters [
	self parse: factory scriptParametersSample rule: #scriptParameters
]

{ #category : #'tests - codeblock' }
PRMicroDownGrammarTest >> testScriptParametersEscape [
	self
		parse: factory scriptParametersEscapeSample
		rule: #scriptParameters
]

{ #category : #'tests - codeblock' }
PRMicroDownGrammarTest >> testScriptParametersMultiple [
	self
		parse: factory scriptParametersMultipleSample
		rule: #scriptParameters
]

{ #category : #'tests - codeblock' }
PRMicroDownGrammarTest >> testScriptTwoParametersNoValue [
	self
		parse: factory scriptTwoParametersNoValueSample
		rule: #scriptParameters
]

{ #category : #'tests - codeblock' }
PRMicroDownGrammarTest >> testScriptWithLanguage [
	self parse: factory scriptWithLanguageSample rule: #script
]

{ #category : #'tests - codeblock' }
PRMicroDownGrammarTest >> testScriptWithNewLine [
	self parse: factory scriptWithNewLineSample rule: #script
]

{ #category : #'tests - codeblock' }
PRMicroDownGrammarTest >> testScriptWithSpaceAtTheEnd [
	self parse: factory scriptWithSpaceAtTheEndSample rule: #script
]

{ #category : #'tests - codeblock' }
PRMicroDownGrammarTest >> testScriptWithSpacedParameters [
	self parse: factory scriptWithSpacedParametersSample rule: #script
]

{ #category : #'tests - format' }
PRMicroDownGrammarTest >> testStrikethroughFormat [
	self parse: factory strikethroughFormatSample rule: #format
]

{ #category : #'tests - format' }
PRMicroDownGrammarTest >> testStrikethroughFormatEmpty [
	self parse: factory strikethroughFormatEmptySample rule: #format
]

{ #category : #'tests - format' }
PRMicroDownGrammarTest >> testSubscriptFormat [
	self parse: factory subscriptFormatSample rule: #format
]

{ #category : #'tests - format' }
PRMicroDownGrammarTest >> testSubscriptFormatEmpty [
	self parse: factory subscriptFormatEmptySample rule: #format
]

{ #category : #'tests - format' }
PRMicroDownGrammarTest >> testSuperscriptFormat [
	self parse: factory superscriptFormatSample rule: #format
]

{ #category : #'tests - format' }
PRMicroDownGrammarTest >> testSuperscriptFormatEmpty [
	self parse: factory superscriptFormatEmptySample rule: #format
]

{ #category : #'tests - list' }
PRMicroDownGrammarTest >> testUnorderedList [
	self parse: factory unorderedListSample rule: #unorderedList
]

{ #category : #'tests - list' }
PRMicroDownGrammarTest >> testUnorderedListEmpty [
	self parse: factory unorderedListEmptySample rule: #unorderedList
]

{ #category : #'tests - list' }
PRMicroDownGrammarTest >> testUnorderedListWithSubList [
	self
		parse: factory unorderedListWithSubListSample
		rule: #unorderedList
]

{ #category : #'tests - list' }
PRMicroDownGrammarTest >> testUnorderedListWithTwoItems [
	self
		parse: factory unorderedListWithTwoItemsSample
		rule: #unorderedList
]
