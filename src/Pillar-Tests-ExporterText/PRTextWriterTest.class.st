Class {
	#name : #PRTextWriterTest,
	#superclass : #PRDocumentWriterTest,
	#category : 'Pillar-Tests-ExporterText'
}

{ #category : #private }
PRTextWriterTest >> actualClass [
	^ PRTextWriter
]

{ #category : #requirements }
PRTextWriterTest >> annotationBegin: annotationString [
	^''
]

{ #category : #requirements }
PRTextWriterTest >> boldFoo [
	^ 'foo'
]

{ #category : #requirements }
PRTextWriterTest >> dataItemWithBar [
	^ 'bar'
]

{ #category : #requirements }
PRTextWriterTest >> definitionListBegin [
	^ ''
]

{ #category : #requirements }
PRTextWriterTest >> emailToFoo [
	^ 'foo@bar.com'
]

{ #category : #requirements }
PRTextWriterTest >> figureAnchorForPierLogo [
	^ ''
]

{ #category : #requirements }
PRTextWriterTest >> figureBegin [
	^ ''
]

{ #category : #requirements }
PRTextWriterTest >> horizontalRule [
	^ ''
]

{ #category : #requirements }
PRTextWriterTest >> italicFoo [
	^ 'foo'
]

{ #category : #requirements }
PRTextWriterTest >> level1HeaderWithFoo [
	^ 'foo'
]

{ #category : #requirements }
PRTextWriterTest >> listItemWith1 [
	^ '1'
]

{ #category : #requirements }
PRTextWriterTest >> monospaceFoo [
	^ 'foo'
]

{ #category : #requirements }
PRTextWriterTest >> orderedListBegin [
	^ ''
]

{ #category : #requirements }
PRTextWriterTest >> packageNamesUnderTest [
	^ #('Pillar-ExporterText')
]

{ #category : #requirements }
PRTextWriterTest >> paragraphFoo [
	^ 'foo'
]

{ #category : #requirements }
PRTextWriterTest >> preformattedFooBegin [
	^ 'foo'
]

{ #category : #requirements }
PRTextWriterTest >> preformattedTextFoo [
	^ 'foo'
]

{ #category : #requirements }
PRTextWriterTest >> rawText [
	^ 'nothing raw in plain text'
]

{ #category : #requirements }
PRTextWriterTest >> referenceToFigurePierLogo [
	^ ''
]

{ #category : #'requirement-InternalLinks' }
PRTextWriterTest >> resultWithRefWithAnchorWithSeparateOutputFiles [
	^ ''
]

{ #category : #'requirement-InternalLinks' }
PRTextWriterTest >> resultWithRefWithAnchorWithoutSeparateOutputFiles [
	^ self resultWithRefWithAnchorWithSeparateOutputFiles
]

{ #category : #'requirement-InternalLinks' }
PRTextWriterTest >> resultWithRefWithoutAnchorWithSeparateOutputFiles [
	^ ''
]

{ #category : #'requirement-InternalLinks' }
PRTextWriterTest >> resultWithRefWithoutAnchorWithoutSeparateOutputFiles [
	^ self resultWithRefWithoutAnchorWithSeparateOutputFiles 
]

{ #category : #'requirement-InternalLinks' }
PRTextWriterTest >> resultWithoutAliasWithRefWithAnchorWithoutSeparateOutputFiles [
	^ ''
]

{ #category : #'requirement-InternalLinks' }
PRTextWriterTest >> resultWithoutAliasWithoutRefWithAnchorWithSeparateOutputFiles [
	^ ''
]

{ #category : #'requirement-InternalLinks' }
PRTextWriterTest >> resultWithoutAliasWithoutRefWithAnchorWithoutSeparateOutputFiles [
	^ ''
]

{ #category : #'requirement-InternalLinks' }
PRTextWriterTest >> resultWithoutRefWithAnchorWithSeparateOutputFiles [
	^ ''
]

{ #category : #'requirement-InternalLinks' }
PRTextWriterTest >> resultWithoutRefWithAnchorWithoutSeparateOutputFiles [
	^ ''
]

{ #category : #requirements }
PRTextWriterTest >> scriptAnchorForMyScript [
	^ ''
]

{ #category : #requirements }
PRTextWriterTest >> scriptWithCaptionBegin [
	^ ''
]

{ #category : #requirements }
PRTextWriterTest >> scriptWithoutCaptionBegin [
	^ ''
]

{ #category : #requirements }
PRTextWriterTest >> strikethroughFoo [
	^ 'foo'
]

{ #category : #requirements }
PRTextWriterTest >> subscriptFoo [
	^ 'foo'
]

{ #category : #requirements }
PRTextWriterTest >> superscriptFoo [
	^ 'foo'
]

{ #category : #tests }
PRTextWriterTest >> supportSyntaxHighlighting [
	^ false
]

{ #category : #requirements }
PRTextWriterTest >> tableBegin [
	^ ''
]

{ #category : #requirements }
PRTextWriterTest >> tableCellWithFoo [
	^ 'foo'
]

{ #category : #requirements }
PRTextWriterTest >> tableCellWithHeadingFoo [
	^ 'foo'
]

{ #category : #requirements }
PRTextWriterTest >> tableRow [
	^ ''
]

{ #category : #requirements }
PRTextWriterTest >> termItemWithFoo [
	^ 'foo'
]

{ #category : #tests }
PRTextWriterTest >> testFigureLabelGenerateAnchor [
	"ignore as there is no anchor support in simple text"
]

{ #category : #tests }
PRTextWriterTest >> testFigureWithWidth [
	"ignore as there is no figure language support in simple text"
]

{ #category : #tests }
PRTextWriterTest >> testFiguresHaveACaption [
	"ignore as there is no caption support in simple text"
]

{ #category : #tests }
PRTextWriterTest >> testMailLink [
	"ignore as there is the email address is not written"
]

{ #category : #tests }
PRTextWriterTest >> testScriptLabelGenerateAnchor [
	"ignore as there is no anchor support in simple text"
]

{ #category : #tests }
PRTextWriterTest >> testScriptLanguage [
	"ignore as there is no script language support in simple text"
]

{ #category : #tests }
PRTextWriterTest >> testScriptWithFormattedCaption [
	"ignore as there is no caption support in simple text"
]

{ #category : #tests }
PRTextWriterTest >> testScriptsHaveACaption [
	"ignore as there is no caption support in simple text"
]

{ #category : #requirements }
PRTextWriterTest >> underlineFoo [
	^ 'foo'
]

{ #category : #requirements }
PRTextWriterTest >> unorderedListBegin [
	^ ''
]
