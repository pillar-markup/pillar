"
Testing PPMarkdownParser and correctness of generated documents
"
Class {
	#name : #PPMarkdownParserTest,
	#superclass : #PPMarkdownGrammarTest,
	#category : #'PetitMarkdown-Tests'
}

{ #category : #accessing }
PPMarkdownParserTest >> multiLineSentence [
	^ 'A sentence.

Another sentence.

 '
]

{ #category : #accessing }
PPMarkdownParserTest >> parserClass [
	^ PPMarkdownParser
]

{ #category : #tests }
PPMarkdownParserTest >> testAsteriskIsEscaped [
    self parse: '\*escaped\*'.
    self assert: result first isBlock.
    self assert: result first inlines first text equals: '*escaped*'.
]

{ #category : #'as yet unclassified' }
PPMarkdownParserTest >> testAutoLinkMail [ 
	super testAutoLinkMail.
	self assert: result url equals: 'foo@bar.com'
]

{ #category : #tests }
PPMarkdownParserTest >> testBulletList [
	super testBulletList.
	self assert: result isList.
	self assert: result size equals: 3.
	self deny: result isOrdered
]

{ #category : #tests }
PPMarkdownParserTest >> testCode [
	super testCode.
	self assert: result isCode
]

{ #category : #tests }
PPMarkdownParserTest >> testCode2 [
	super testCode2.
	self assert: result isCode
]

{ #category : #tests }
PPMarkdownParserTest >> testCode3 [
	super testCode3.
	self assert: result isCode
]

{ #category : #tests }
PPMarkdownParserTest >> testEmphasis1 [
	super testEmphasis1.
	self assert: result isEmphasis.
	self assert: result inlines size equals: 1.
	self assert: result inlines first text equals: 'subtly suggested'.
]

{ #category : #tests }
PPMarkdownParserTest >> testEmphasis2 [
	super testEmphasis2.
	self assert: result isEmphasis.
	self assert: result inlines size equals: 1.
	self assert: result inlines first text equals: 'subtly suggested'.
]

{ #category : #tests }
PPMarkdownParserTest >> testEscapedCharacters [
	#('\\' '\`' '\*' '\_' '\{' '\}' '\[' '\]' '\(' '\)' '\>' '\#' '\.' '\!' '\+' '\-') do:
		[:each |
			self parse: each rule: #escapedCharacter.
			self assert: result equals: each second asString ]
]

{ #category : #tests }
PPMarkdownParserTest >> testExclamationMark [
	| str inlines |
	str := 'Surprise! This should work'.
	self parse: str.
	inlines := result first inlines.
	self assert: str equals: inlines first text.

]

{ #category : #'testing-markdowntest' }
PPMarkdownParserTest >> testExplicitLink [
	| inlines |
	super testExplicitLink.
	self assert: result isLink description: 'Node should be link'.
	self assert: result text equals: 'example link'.
	self assert: result label equals: ''.
	self assert: result url equals: 'http://example.com/'.
]

{ #category : #'as yet unclassified' }
PPMarkdownParserTest >> testHeadingAtx1 [
	super testHeadingAtx1.
	self assert: result isBlock.
	self assert: result level equals: 1.
	self assert: result inlines size equals: 1.
	self assert: result inlines first isText.
	self assert: result inlines first text equals: 'Hello, this is an atx-style title'. 
]

{ #category : #'as yet unclassified' }
PPMarkdownParserTest >> testHeadingAtx2 [
	super testHeadingAtx2.
	self assert: result isBlock.
	self assert: result level equals: 2.
	self assert: result inlines size equals: 1.
	self assert: result inlines first isText.
	self assert: result inlines first text equals: 'Hello, this is an atx-style title'. 

]

{ #category : #'as yet unclassified' }
PPMarkdownParserTest >> testHeadingAtx3 [
	super testHeadingAtx3.
	self assert: result isBlock.
	self assert: result level equals: 3.
	self assert: result inlines size equals: 1.
	self assert: result inlines first isText.
	self assert: result inlines first text equals: 'Hello, this is an atx-style title'. 

]

{ #category : #'as yet unclassified' }
PPMarkdownParserTest >> testHeadingSetext1 [
	super testHeadingSetext1.
	self assert: result isBlock.
	self assert: result level equals: 1.
	self assert: result inlines size equals: 1.
	self assert: result inlines first text equals: 'Hello, this is a setext-style title'.

]

{ #category : #'as yet unclassified' }
PPMarkdownParserTest >> testHeadingSetext2 [
	super testHeadingSetext2.
	self assert: result isBlock.
	self assert: result level equals: 2.
	self assert: result inlines size equals: 1.
	self assert: result inlines first text equals: 'Hello, this is a setext-style title'.

]

{ #category : #tests }
PPMarkdownParserTest >> testImageParsing [
	| paragraphWithImage firstInlineOfParagraph |
	self parse: '![Environment](/img/greenfoot_visual.png)'.
	paragraphWithImage := result first.
	firstInlineOfParagraph := paragraphWithImage inlines first.
	self assert: firstInlineOfParagraph isImage description: 'Node should be image'
]

{ #category : #tests }
PPMarkdownParserTest >> testInlineLinkEmpty [
	super testInlineLinkEmpty.
	self assert: result isLink.
	self assert: result label equals: ''.
	self assert: result url equals: ''.
	self assert: result text equals: 'empty'.
]

{ #category : #tests }
PPMarkdownParserTest >> testInlineLinkJustUrl [
	super testInlineLinkJustUrl.
	self assert: result isLink.
	self assert: result label equals: ''.
	self assert: result url equals: '/url/'.
	self assert: result text equals: 'URL'.
]

{ #category : #tests }
PPMarkdownParserTest >> testInlineLinkSpacing1 [
	super testInlineLinkSpacing1.
	self assert: result isLink.
	self assert: result label equals: 'title preceded by two spaces'.
	self assert: result url equals: '/url/'.
	self assert: result text equals: 'URL and title'.
]

{ #category : #tests }
PPMarkdownParserTest >> testInlineLinkSpacing2 [
	super testInlineLinkSpacing2.
	self assert: result isLink.
	self assert: result label equals: 'title preceded by a tab'.
	self assert: result url equals: '/url/'.
	self assert: result text equals: 'URL and title'.
]

{ #category : #tests }
PPMarkdownParserTest >> testInlineLinkSpacing3 [
	super testInlineLinkSpacing3.
	self assert: result isLink.
	self assert: result label = 'title has spaces afterward'.
	self assert: result url = '/url/'.
	self assert: result text = 'URL and title'.
]

{ #category : #tests }
PPMarkdownParserTest >> testInlinesMultiline [
	| text |
	super testInlinesMultiline.
	self assert: result isCollection.
	self assert: result size = 1.
	
	text := result first.
	self assert: text isText.
	
	self assert: text text = 'one two three four'.
]

{ #category : #tests }
PPMarkdownParserTest >> testInlinesMultilineLineBreak [
	| text |
	super testInlinesMultilineLineBreak.
	self assert: result isCollection.
	self assert: result size = 7.
	self assert: (result at: 1) isText.
	self assert: (result at: 2) isLinebreak.
	self assert: (result at: 3) isText.
	self assert: (result at: 4) isLinebreak.
	self assert: (result at: 5) isText.
	self assert: (result at: 6) isLinebreak.
	self assert: (result at: 7) isText.
	
]

{ #category : #'testing-markdowntest' }
PPMarkdownParserTest >> testLink [
	| inlines |
	super testLink.
	self assert: result isLink description: 'Node should be link'.
	self assert: result text equals: 'http://example.com/'.
	self assert: result label equals: ''.
	self assert: result url equals: 'http://example.com/'.
]

{ #category : #tests }
PPMarkdownParserTest >> testLinkDefinitionAngleBracketURL [
	super testLinkDefinitionAngleBracketURL.
	self assert: result isLink.
	self assert: result label equals: 'foo'.
	self assert: result text equals: 'An optional Title'.
	self assert: result url equals: 'http://example.com/'.

]

{ #category : #tests }
PPMarkdownParserTest >> testListItemSimple1 [
	super testListItemSimple1.
	self assert: result isItem.
	self assert: result label value equals: '*'.
	self assert: result children first isText.
	self assert: result children first text equals: 'plop'
]

{ #category : #'testing-basics' }
PPMarkdownParserTest >> testListItemSimple2 [
	super testListItemSimple2.
	self assert: result isItem.
	self assert: result label value equals: '-'.
	self assert: result children size equals: 1.
	self assert: result children first isText.
	self assert: result children first text equals: 'plop coin pan'
]

{ #category : #tests }
PPMarkdownParserTest >> testNoOrderedCollectionInResult [
	self parse: self multiLineSentence.
	self
		assert: (result allSatisfy: [ :node | node isKindOf: PPMarkdownNode ])
		description: 'Nodes should be of kind PPMarkdownNode'
]

{ #category : #tests }
PPMarkdownParserTest >> testOnlyOneTextInline [
	| str inlines |
	str := 'Surprise. This should work'.
	self parse: str.
	inlines := result first inlines.
	self assert: (inlines size = 1) description: 'Should have only one inline'.
	self assert: (inlines first) isText description: 'Inline should be text'.

]

{ #category : #tests }
PPMarkdownParserTest >> testOrderedList [
	super testOrderedList.
	self assert: result isList.
	self assert: result size equals: 3.
	self assert: result isOrdered

]

{ #category : #tests }
PPMarkdownParserTest >> testParagraph [
	super testParagraph.
	self assert: result isBlock.
	self assert: result inlines size = 1.
	self assert: result inlines first isText.
	self assert: result inlines first text = 'Hello, this is a trivial Markdown paragraph with three lines.'
]

{ #category : #tests }
PPMarkdownParserTest >> testParagraph2 [
	| text code link |
	super testParagraph2.
	self assert: result isBlock.
	self assert: result inlines size = 5.
	
	self assert: result inlines first isText.
	self assert: result inlines second isCode.
	self assert: result inlines third isText.
	self assert: result inlines fourth isLink.
	self assert: (result inlines at: 5) isText.
	
	text := result inlines first.
	self assert: text text = 'Hello, this is a more '.
	
	code := result inlines second.
	self assert: code text = 'complext'.
	
	text := result inlines third.
	self assert: text text = ' Markdown paragraph with three lines and a '.
	
	link := result inlines fourth.
	self assert: link text = 'URL'.
	self assert: link url = '/url/'.
	self assert: link label = 'title preceded by two spaces'.
	
	text := result inlines at: 5.
	self assert: text text = ' .'.
]

{ #category : #tests }
PPMarkdownParserTest >> testParagraphs [
	super testParagraphs.
	self assert: result size == 4.
	result do: [ :node|
		self assert: (node isKindOf: PPMarkdownParagraph) ].
]

{ #category : #tests }
PPMarkdownParserTest >> testParseLinkInlines [
	| link |
	self parse: '[url text](http://www.hello.de/)' rule: #inlines.
	self assert: result size equals: 1.
	link := result first.
	self assert: link url equals: 'http://www.hello.de/'.
	self assert: link label equals: ''.
	self assert: link text equals: 'url text'
]

{ #category : #'testing-markdowntest' }
PPMarkdownParserTest >> testReferenceLink [
	super testReferenceLink.
	self assert: result isLink description: 'Node should be link'.	
]

{ #category : #tests }
PPMarkdownParserTest >> testStrong1 [
	super testStrong1.
	self assert: result isStrong.
	self assert: result inlines size = 1.
	self assert: result inlines first text = 'loud and clear'.
]

{ #category : #tests }
PPMarkdownParserTest >> testStrong2 [
	super testStrong2.
	self assert: result isStrong.
	self assert: result inlines size = 1.
	self assert: result inlines first text = 'loud and clear'.
]

{ #category : #tests }
PPMarkdownParserTest >> testURL1 [
	super testURL1.
	self assert: result isLink.
]

{ #category : #tests }
PPMarkdownParserTest >> testVerbatim [
	super testVerbatim.
	self assert: result isVerbatim.
	self assert: result text = 'with spaces indented'.
]

{ #category : #tests }
PPMarkdownParserTest >> testVerbatim2 [
	super testVerbatim2.
	self assert: result isVerbatim.
	self assert: result text = 'with tab indented'.
]

{ #category : #tests }
PPMarkdownParserTest >> testVerbatim4 [
	super testVerbatim4.
	self assert: result isVerbatim.
	self assert: result text = 'String tab, 
with space
indented and multiple lines'.
]
