Class {
	#name : #PRAsciiDocWriterTest,
	#superclass : #PRDocumentWriterTest,
	#category : 'Pillar-Tests-ExporterAsciiDoc'
}

{ #category : #private }
PRAsciiDocWriterTest >> actualClass [
	^ PRAsciiDocWriter
]

{ #category : #requirements }
PRAsciiDocWriterTest >> boldFoo [
	^ '*foo*'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> dataItemWithBar [
	^ ':: bar'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> definitionListBegin [
	^''
]

{ #category : #requirements }
PRAsciiDocWriterTest >> emailToFoo [
	^'foo@bar.com'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> figureAnchorForPierLogo [
	^ '[[pierLogo]]'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> figureBegin [
	^ 'image::'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> footnoteBar [
	^ 'footnote:[Bar]'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> horizontalRule [
	^ ''''''''
]

{ #category : #requirements }
PRAsciiDocWriterTest >> italicFoo [
	^ '''foo'''
]

{ #category : #requirements }
PRAsciiDocWriterTest >> level1HeaderWithFoo [
	^ '= foo'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> listItemWith1 [
	^'1'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> monospaceFoo [
	^ '+foo+'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> orderedListBegin [
	^ '. '
]

{ #category : #requirements }
PRAsciiDocWriterTest >> packageNamesUnderTest [
	^ #('Pillar-ExporterAsciiDoc')
]

{ #category : #requirements }
PRAsciiDocWriterTest >> paragraphFoo [
	^'foo'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> preformattedFooBegin [
	^ ' '
]

{ #category : #requirements }
PRAsciiDocWriterTest >> preformattedTextFoo [
	^ 'foo'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> rawText [
	^ '[underline]''*foo*'''
]

{ #category : #requirements }
PRAsciiDocWriterTest >> referenceToFigurePierLogo [
	^ '<<pierLogo>>'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> resultForCaution [
	^ 'CAUTION:'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> resultForImportant [
	^ 'IMPORTANT:'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> resultForNotRecognizedPatterns [
	^ ''
]

{ #category : #requirements }
PRAsciiDocWriterTest >> resultForNote [
	^ 'NOTE:'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> resultForTip [
	^ 'TIP:'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> resultForWarning [
	^ 'WARNING:'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> scriptAnchorForMyScript [
	^ '[[myScript]]'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> scriptWithCaptionBegin [
	^'----'
	
	"TODO: Test does not run"
]

{ #category : #requirements }
PRAsciiDocWriterTest >> scriptWithoutCaptionBegin [
	^'----'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> strikethroughFoo [
	^ '[line-through]foo'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> subscriptFoo [
	^ '~foo~'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> superscriptFoo [
	^ '^foo^'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> tableBegin [
	^ '|==='
]

{ #category : #requirements }
PRAsciiDocWriterTest >> tableCellWithFoo [
	^ '|foo'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> tableCellWithHeadingFoo [
	^'|foo'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> tableRow [
	^''
]

{ #category : #requirements }
PRAsciiDocWriterTest >> termItemWithFoo [
	^'foo'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> testAnnotation [
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

{ #category : #requirements }
PRAsciiDocWriterTest >> testFigureWithoutLabelAndWithoutCaptionAreExportedWithoutEnvironment [
	self skip: 'no figure environment in asciidoc'
]

{ #category : #'as yet unclassified' }
PRAsciiDocWriterTest >> testInternalLinkWithAliasWithRefWithAncorWithSeparateOutputFiles [
	self flag: 'TODO: check if this is important after large refactoring'
]

{ #category : #'as yet unclassified' }
PRAsciiDocWriterTest >> testInternalLinkWithAliasWithReferenceWithoutAnchorWithSeparateOutputFiles [
	self flag: 'TODO: check if this is important after large refactoring'
]

{ #category : #'as yet unclassified' }
PRAsciiDocWriterTest >> testInternalLinkWithAliasWithoutReferenceWithAnchorWithSeparateOutputFiles [
	self flag: 'TODO: check if this is important after large refactoring'
]

{ #category : #'as yet unclassified' }
PRAsciiDocWriterTest >> testInternalLinkWithoutAliasWithRefWithAncorWithSeparateOutputFiles [
	self flag: 'TODO: check if this is important after large refactoring'
]

{ #category : #'as yet unclassified' }
PRAsciiDocWriterTest >> testInternalLinkWithoutAliasWithReferenceWithoutAnchorWithSeparateOutputFiles [
	self flag: 'TODO: check if this is important after large refactoring'
]

{ #category : #'as yet unclassified' }
PRAsciiDocWriterTest >> testInternalLinkWithoutAliasWithoutReferenceWithAnchorWithSeparateOutputFiles [
	self flag: 'TODO: check if this is important after large refactoring'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> underlineFoo [
	^ '[underline]foo'
]

{ #category : #requirements }
PRAsciiDocWriterTest >> unorderedListBegin [
	^ '* '
]
