Class {
	#name : #PRMarkdownWriterTest,
	#superclass : #PRDocumentWriterTest,
	#category : #'Pillar-Tests-ExporterMarkdown'
}

{ #category : #private }
PRMarkdownWriterTest >> actualClass [
	^ PRMarkdownWriter
]

{ #category : #requirements }
PRMarkdownWriterTest >> boldFoo [
	^ '**foo**'
]

{ #category : #requirements }
PRMarkdownWriterTest >> dataItemWithBar [
	^ 'bar'
]

{ #category : #requirements }
PRMarkdownWriterTest >> definitionListBegin [
	^''
]

{ #category : #asserting }
PRMarkdownWriterTest >> deny: result includesSubstring: expected [
	expected ifEmpty: [ ^ self ].
	self deny: (result includesSubstring: expected) description: ('''{1}'' is in ''{2}''' format: {expected . result})
]

{ #category : #asserting }
PRMarkdownWriterTest >> denyWriting: aDocumentItem includesText: aString [
	| result |
	result := self write: aDocumentItem.
	self deny: result includesSubstring: aString
]

{ #category : #requirements }
PRMarkdownWriterTest >> emailToFoo [

	^ 'foo@bar.com'
]

{ #category : #requirements }
PRMarkdownWriterTest >> figureAnchorForPierLogo [
	^ '[pierLogo]'
]

{ #category : #requirements }
PRMarkdownWriterTest >> figureBegin [
	^ '!['
]

{ #category : #requirements }
PRMarkdownWriterTest >> horizontalRule [
	^ '---'
]

{ #category : #requirements }
PRMarkdownWriterTest >> italicFoo [
	^ '*foo*'
]

{ #category : #requirements }
PRMarkdownWriterTest >> level1HeaderBegin [
	^ '#'
]

{ #category : #requirements }
PRMarkdownWriterTest >> level1HeaderWithFoo [
	^ '# foo'
]

{ #category : #requirements }
PRMarkdownWriterTest >> level2HeaderBegin [
	^ '##'
]

{ #category : #requirements }
PRMarkdownWriterTest >> level3HeaderBegin [
	^ '### '
]

{ #category : #requirements }
PRMarkdownWriterTest >> listItemWith1 [
	^ '1'
]

{ #category : #requirements }
PRMarkdownWriterTest >> monospaceFoo [
	^ '`foo`'
]

{ #category : #requirements }
PRMarkdownWriterTest >> orderedListBegin [
	^ '1. '
]

{ #category : #requirements }
PRMarkdownWriterTest >> packageNamesUnderTest [
	^ #('Pillar-ExporterMarkdown')
]

{ #category : #requirements }
PRMarkdownWriterTest >> paragraphFoo [
	^ 'foo'
]

{ #category : #requirements }
PRMarkdownWriterTest >> preformattedFooBegin [
	
	^ ''
]

{ #category : #requirements }
PRMarkdownWriterTest >> preformattedTextFoo [
	
	^ ''
]

{ #category : #requirements }
PRMarkdownWriterTest >> rawText [
	
	^ 'raw text'
]

{ #category : #requirements }
PRMarkdownWriterTest >> referenceToFigurePierLogo [
	^ '(#pierLogo)'
]

{ #category : #'as yet unclassified' }
PRMarkdownWriterTest >> resultForCaution [

	^ '> **caution**:'
]

{ #category : #'as yet unclassified' }
PRMarkdownWriterTest >> resultForImportant [

	^ '> **todo**:'
]

{ #category : #'as yet unclassified' }
PRMarkdownWriterTest >> resultForNotRecognizedPatterns [

	^ '> **toto**: '
]

{ #category : #'as yet unclassified' }
PRMarkdownWriterTest >> resultForNote [

	^ '> **note**:'
]

{ #category : #'as yet unclassified' }
PRMarkdownWriterTest >> resultForTip [
	
	^ '> **tip**:'
]

{ #category : #'as yet unclassified' }
PRMarkdownWriterTest >> resultForWarning [

	^ '> **warning**:'
]

{ #category : #requirements }
PRMarkdownWriterTest >> resultWithRefWithAnchorWithSeparateOutputFiles [
	^ '(ref.html#foo)'
]

{ #category : #requirements }
PRMarkdownWriterTest >> resultWithRefWithoutAnchorWithSeparateOutputFiles [
	^ '(ref.html)'
]

{ #category : #'requirement-InternalLinks' }
PRMarkdownWriterTest >> resultWithRefWithoutAnchorWithoutSeparateOutputFiles [
	
	^ ''
]

{ #category : #requirements }
PRMarkdownWriterTest >> resultWithoutAliasWithoutRefWithAnchorWithSeparateOutputFiles [
	^ '(#foo)'
]

{ #category : #requirements }
PRMarkdownWriterTest >> resultWithoutRefWithAnchorWithSeparateOutputFiles [
	^ '(#foo)'
]

{ #category : #requirements }
PRMarkdownWriterTest >> scriptAnchorForMyScript [
	^ self configuration newLine
		,
			'```
myscript
```'
]

{ #category : #requirements }
PRMarkdownWriterTest >> scriptWithCaptionBegin [
	^ self configuration newLine , '```'
]

{ #category : #requirements }
PRMarkdownWriterTest >> scriptWithoutCaptionBegin [
	^ self configuration newLine , '```'
]

{ #category : #requirements }
PRMarkdownWriterTest >> strikethroughFoo [
	
	"Markdown does not implement underlyning, so it ignores it"
	^ 'foo'
]

{ #category : #requirements }
PRMarkdownWriterTest >> tableBegin [
	
	"Markdown does not provide tables by default"
	^ ''
]

{ #category : #requirements }
PRMarkdownWriterTest >> tableCellWithFoo [
	
	^ 'foo'
]

{ #category : #requirements }
PRMarkdownWriterTest >> tableCellWithHeadingFoo [

	"Markdown does not provide tables by default"
	^ 'foo'
]

{ #category : #requirements }
PRMarkdownWriterTest >> tableRow [
	
	"Markdown does not provide tables by default"
	^ ''
]

{ #category : #requirements }
PRMarkdownWriterTest >> termItemWithFoo [
	^ '- **foo**.'
]

{ #category : #tests }
PRMarkdownWriterTest >> testAnnotation [
	| note tip warning caution important nonRecognized text |
	text := PRText content: 'foo'.
	note := PRAnnotatedParagraph new
		annotation: 'note';
		add: text.
	tip := PRAnnotatedParagraph new
		annotation: 'tip';
		add: text.
	warning := PRAnnotatedParagraph new
		annotation: 'warning';
		add: text.
	caution := PRAnnotatedParagraph new
		annotation: 'caution';
		add: text.
	important := PRAnnotatedParagraph new
		annotation: 'todo';
		add: text.
	nonRecognized := PRAnnotatedParagraph new
		annotation: 'toto';
		add: text.
	self assertWriting: note includesText: self resultForNote.
	self assertWriting: tip includesText: self resultForTip.
	self assertWriting: warning includesText: self resultForWarning.
	self assertWriting: caution includesText: self resultForCaution.
	self assertWriting: important includesText: self resultForImportant.
	self assert: (self write: nonRecognized) trimRight equals: (self resultForNotRecognizedPatterns, text text).
]

{ #category : #tests }
PRMarkdownWriterTest >> testFigureWithoutLabelAndWithoutCaptionAreExportedWithoutEnvironment [
	self skip "Figures are no environnement in Markdown"
]

{ #category : #tests }
PRMarkdownWriterTest >> testNestingList [
	| item expected |
	item := PRUnorderedList new
		add:
			(PRListItem new
				add:
					(PROrderedList new
						add:
							(PRListItem new
								add: (PRText content: self listItemWith1);
								yourself);
						yourself);
				yourself);
		yourself.
	expected := '' writeStream << '- ' << self configuration newLine << '  ' << self orderedListBegin
		<< self listItemWith1.
	self assert: (self write: item) includesSubstring: expected contents
]

{ #category : #tests }
PRMarkdownWriterTest >> testNestingListWith2Item [
	| item expected |
	item := PRUnorderedList new
		add:
			(PRListItem new
				add:
					(PROrderedList new
						add:
							(PRListItem new
								add: (PRText content: self listItemWith1);
								yourself);
						yourself);
				yourself);
		add:
			(PRListItem new
				add: (PRText content: self listItemWith1);
				yourself);
		yourself.
	expected := '' writeStream << self unorderedListBegin << self configuration newLine << '  '
		<< self orderedListBegin << self listItemWith1 << self configuration newLine
		<< self unorderedListBegin << self listItemWith1.
	self assert: (self write: item) includesSubstring: expected contents
]

{ #category : #tests }
PRMarkdownWriterTest >> testNestingListWith2ItemWith2SubItem [
	| item expected |
	item := PRUnorderedList new
		add:
			(PRListItem new
				add:
					(PROrderedList new
						add:
							(PRListItem new
								add: (PRText content: self listItemWith1);
								add:
									(PROrderedList new
										add:
											(PRListItem new
												add: (PRText content: self listItemWith1);
												yourself);
										yourself);
								yourself);
						yourself);
				yourself);
		add:
			(PRListItem new
				add: (PRText content: self listItemWith1);
				yourself);
		yourself.
	expected := '' writeStream << self unorderedListBegin << self configuration newLine << '  '
		<< self orderedListBegin << self listItemWith1 << self configuration newLine << '    ' << self orderedListBegin
		<< self listItemWith1 << self configuration newLine << self unorderedListBegin << self listItemWith1.
	self assert: (self write: item) includesSubstring: expected contents
]

{ #category : #tests }
PRMarkdownWriterTest >> testScriptLabelGenerateAnchor [

	"Markdown does not support scripts with labels"
	^ self skip
]

{ #category : #tests }
PRMarkdownWriterTest >> testScriptWithFormattedCaption [

	"Markdown does not support scripts with captions"
	^ self skip
]

{ #category : #tests }
PRMarkdownWriterTest >> testScriptsHaveACaption [

	"Markdown does not support scripts with captions"
	^ self skip
]

{ #category : #tests }
PRMarkdownWriterTest >> testSubscriptFormat [

	"Subscripts are not supported in markdown"
	^ self skip
]

{ #category : #tests }
PRMarkdownWriterTest >> testSuperscriptFormat [

	"Superscripts are not supported in markdown"
	^ self skip
]

{ #category : #requirements }
PRMarkdownWriterTest >> underlineFoo [
	
	"Markdown does not implement underlyning, so it ignores it"
	^ 'foo'
]

{ #category : #requirements }
PRMarkdownWriterTest >> unorderedListBegin [
	^ '- '
]

{ #category : #requirements }
PRMarkdownWriterTest >> widthFor50percents [
	^ ''
]
