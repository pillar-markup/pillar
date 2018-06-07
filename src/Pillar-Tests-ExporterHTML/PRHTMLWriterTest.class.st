Class {
	#name : #PRHTMLWriterTest,
	#superclass : #PRManualNumberingWriterTest,
	#category : 'Pillar-Tests-ExporterHTML'
}

{ #category : #testing }
PRHTMLWriterTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRHTMLWriterTest >> actualClass [
	^ PRHTMLWriter
]

{ #category : #requirements }
PRHTMLWriterTest >> annotationBegin: annotationString [
	^'<p class="' , annotationString, '">' 
]

{ #category : #requirements }
PRHTMLWriterTest >> boldFoo [
	^ '<strong>foo</strong>'
]

{ #category : #requirements }
PRHTMLWriterTest >> dataItemWithBar [
	^ '<dd>bar</dd>'
]

{ #category : #requirements }
PRHTMLWriterTest >> definitionListBegin [
	^ '<dl>'
]

{ #category : #requirements }
PRHTMLWriterTest >> emailToFoo [
	^ '<a href="mailto:foo@bar.com">'
]

{ #category : #requirements }
PRHTMLWriterTest >> figureAnchorForPierLogo [
	^ '<a id="pierLogo">'
]

{ #category : #requirements }
PRHTMLWriterTest >> figureBegin [
	^ '<figure>'
]

{ #category : #private }
PRHTMLWriterTest >> footnoteBar [
	^ '<sup><a href="#footnote1">[1]</a></sup>'
]

{ #category : #requirements }
PRHTMLWriterTest >> horizontalRule [
	^ '<hr>'
]

{ #category : #requirements }
PRHTMLWriterTest >> italicFoo [
	^ '<em>foo</em>'
]

{ #category : #requirements }
PRHTMLWriterTest >> level1HeaderBegin [
	^ '<h1>'
]

{ #category : #requirements }
PRHTMLWriterTest >> level1HeaderWithFoo [
	^ '<h1>foo</h1>'
]

{ #category : #requirements }
PRHTMLWriterTest >> level2HeaderBegin [
	^ '<h2>'
]

{ #category : #requirements }
PRHTMLWriterTest >> level3HeaderBegin [
	^ '<h3>'
]

{ #category : #requirements }
PRHTMLWriterTest >> listItemWith1 [
	^ '<li>1</li>'
]

{ #category : #requirements }
PRHTMLWriterTest >> monospaceFoo [
	^ '<code>foo</code>'
]

{ #category : #requirements }
PRHTMLWriterTest >> orderedListBegin [
	^ '<ol>'
]

{ #category : #accessing }
PRHTMLWriterTest >> packageNamesUnderTest [
	^ #('Pillar-ExporterHTML')
]

{ #category : #requirements }
PRHTMLWriterTest >> paragraphFoo [
	^ '<p>' , Smalltalk os lineEnding , 'foo' , Smalltalk os lineEnding , '</p>'
]

{ #category : #requirements }
PRHTMLWriterTest >> preformattedFooBegin [
	^ '<pre>'
]

{ #category : #requirements }
PRHTMLWriterTest >> preformattedTextFoo [
	^ 'foo'
]

{ #category : #requirements }
PRHTMLWriterTest >> rawText [
	^ '<img>'
]

{ #category : #'requirement-InternalLinks' }
PRHTMLWriterTest >> resultWithRefWithAnchorWithSeparateOutputFiles [
	^ 'href="ref.html#foo"'
]

{ #category : #'requirement-InternalLinks' }
PRHTMLWriterTest >> resultWithRefWithAnchorWithoutSeparateOutputFiles [
	^ 'href="#foo"'
]

{ #category : #'requirement-InternalLinks' }
PRHTMLWriterTest >> resultWithRefWithoutAnchorWithSeparateOutputFiles [
	^ 'href="ref.html"'
]

{ #category : #'requirement-InternalLinks' }
PRHTMLWriterTest >> resultWithRefWithoutAnchorWithoutSeparateOutputFiles [
	^ ''
]

{ #category : #'requirement-InternalLinks' }
PRHTMLWriterTest >> resultWithoutAliasWithRefWithAnchorWithoutSeparateOutputFiles [
	^ 'href="#foo"'
]

{ #category : #'requirement-InternalLinks' }
PRHTMLWriterTest >> resultWithoutAliasWithoutRefWithAnchorWithSeparateOutputFiles [
	^ 'href="#foo"'
]

{ #category : #'requirement-InternalLinks' }
PRHTMLWriterTest >> resultWithoutAliasWithoutRefWithAnchorWithoutSeparateOutputFiles [
	^ 'href="#foo"'
]

{ #category : #'requirement-InternalLinks' }
PRHTMLWriterTest >> resultWithoutRefWithAnchorWithSeparateOutputFiles [
	^ 'href="#foo"'
]

{ #category : #'requirement-InternalLinks' }
PRHTMLWriterTest >> resultWithoutRefWithAnchorWithoutSeparateOutputFiles [
	^ 'href="#foo"'
]

{ #category : #requirements }
PRHTMLWriterTest >> scriptAnchorForMyScript [
	^ '<a id="myScript">'
]

{ #category : #requirements }
PRHTMLWriterTest >> scriptWithCaptionBegin [
	^ '<pre><code'
]

{ #category : #requirements }
PRHTMLWriterTest >> scriptWithoutCaptionBegin [
	^ '<pre><code'
]

{ #category : #requirements }
PRHTMLWriterTest >> strikethroughFoo [
	^ '<s>foo</s>'
]

{ #category : #requirements }
PRHTMLWriterTest >> subscriptFoo [
	^ '<sub>foo</sub>'
]

{ #category : #requirements }
PRHTMLWriterTest >> superscriptFoo [
	^ '<sup>foo</sup>'
]

{ #category : #requirements }
PRHTMLWriterTest >> tableBegin [
	^ '<table'
]

{ #category : #requirements }
PRHTMLWriterTest >> tableCellWithFoo [
	^ '<td>foo</td>'
]

{ #category : #requirements }
PRHTMLWriterTest >> tableCellWithHeadingFoo [
	^ '<th>foo</th>'
]

{ #category : #requirements }
PRHTMLWriterTest >> tableRow [
	^ '<tr>'
]

{ #category : #requirements }
PRHTMLWriterTest >> termItemWithFoo [
	^ '<dt>foo</dt>'
]

{ #category : #tests }
PRHTMLWriterTest >> testAnchor [
	| item |
	item := PRAnchor new name: 'foo'.
	self assertWriting: item includesText: 'id="foo"'
]

{ #category : #tests }
PRHTMLWriterTest >> testExportingIsolatedRaw [
	"The idea is that you don''t want the <p> when using a Raw that potentially displays a <div>, because this is not HTML compliant"

	| item |
	item := PRDocument new
		add:
				(PRParagraph new
						add: (PRRaw content: '<div>foo</div>');
						yourself);
		yourself.
	self assert: (self write: item) equals: '<div>foo</div>'
]

{ #category : #tests }
PRHTMLWriterTest >> testFootnoteAtEnd [
	| item |
	item := PRFootnote new note: 'foo'.
	self assertWriting: item includesText: '<sup id="footnote1">[1] foo</sup>'
]

{ #category : #'tests-internalLinks' }
PRHTMLWriterTest >> testInternalLinkWithAliasWithReferenceWithoutAnchorWithoutSeparateOutputFiles [
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: 'ref')
						addAll: {(PRText content: 'Alias')};
						yourself);
		yourself.
	self should: [ resultString := self write: item ] raise: PRLinkWarning.
	[  resultString := self write: item ] on: PRLinkWarning do: [:w | w resume ].
	self resultWithRefWithoutAnchorWithoutSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithRefWithoutAnchorWithoutSeparateOutputFiles) ].
	self assert: (resultString includesSubstring: 'Alias')
]

{ #category : #'tests-internalLinks' }
PRHTMLWriterTest >> testInternalLinkWithoutAliasWithReferenceWithoutAnchorWithoutSeparateOutputFiles [
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: 'ref')
						addAll: {(PRText content: 'Alias')};
						yourself);
		yourself.
	self should: [ resultString := self write: item ] raise: PRLinkWarning.
	[ resultString := self write: item ]
		on: PRLinkWarning
		do: [ :w | w resume ].
	self resultWithRefWithoutAnchorWithoutSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithRefWithoutAnchorWithoutSeparateOutputFiles) ]
]

{ #category : #requirements }
PRHTMLWriterTest >> underlineFoo [
	^ '<u>foo</u>'
]

{ #category : #requirements }
PRHTMLWriterTest >> unorderedListBegin [
	^ '<ul>'
]

{ #category : #requirements }
PRHTMLWriterTest >> widthFor50percents [
	^ '50%'
]
