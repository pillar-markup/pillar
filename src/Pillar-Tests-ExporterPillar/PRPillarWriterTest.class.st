Class {
	#name : #PRPillarWriterTest,
	#superclass : #PRDocumentWriterTest,
	#category : 'Pillar-Tests-ExporterPillar'
}

{ #category : #private }
PRPillarWriterTest >> actualClass [
	^ PRPillarWriter
]

{ #category : #requirements }
PRPillarWriterTest >> annotationBegin: annotationString [
	^'@@' , annotationString.
]

{ #category : #requirements }
PRPillarWriterTest >> boldFoo [
	^ '""foo""'
]

{ #category : #requirements }
PRPillarWriterTest >> dataItemWithBar [
	^ ':bar'
]

{ #category : #requirements }
PRPillarWriterTest >> definitionListBegin [
	^ ';'
]

{ #category : #requirements }
PRPillarWriterTest >> emailToFoo [
	^ 'foo@bar.com*'
]

{ #category : #requirements }
PRPillarWriterTest >> figureAnchorForPierLogo [
	^ 'label=pierLogo'
]

{ #category : #requirements }
PRPillarWriterTest >> figureBegin [
	^ '+'
]

{ #category : #requirements }
PRPillarWriterTest >> horizontalRule [
	^ '_'
]

{ #category : #requirements }
PRPillarWriterTest >> italicFoo [
	^ '''foo'''
]

{ #category : #accessing }
PRPillarWriterTest >> level1HeaderBegin [
	^ self shouldBeImplemented
]

{ #category : #requirements }
PRPillarWriterTest >> level1HeaderWithFoo [
	^ '!foo'
]

{ #category : #accessing }
PRPillarWriterTest >> level2HeaderBegin [
	^ self shouldBeImplemented
]

{ #category : #accessing }
PRPillarWriterTest >> level3HeaderBegin [
	^ self shouldBeImplemented
]

{ #category : #requirements }
PRPillarWriterTest >> listItemWith1 [
	^ '1'
]

{ #category : #requirements }
PRPillarWriterTest >> monospaceFoo [
	^ '==foo=='
]

{ #category : #requirements }
PRPillarWriterTest >> orderedListBegin [
	^ '#'
]

{ #category : #requirements }
PRPillarWriterTest >> packageNamesUnderTest [
	^ #('Pillar-ExporterPillar')
]

{ #category : #requirements }
PRPillarWriterTest >> paragraphFoo [
	^ 'foo'
]

{ #category : #requirements }
PRPillarWriterTest >> preformattedFooBegin [
	^ '='
]

{ #category : #requirements }
PRPillarWriterTest >> preformattedTextFoo [
	^ 'foo'
]

{ #category : #requirements }
PRPillarWriterTest >> rawText [
	^ '*foo>http://bar.com* ''italic'''
]

{ #category : #requirements }
PRPillarWriterTest >> referenceToFigurePierLogo [
	^ '*@pierLogo*'
]

{ #category : #'requirement-InternalLinks' }
PRPillarWriterTest >> resultWithRefWithAnchorWithSeparateOutputFiles [
	^ 'ref.pillar@foo'
]

{ #category : #'requirement-InternalLinks' }
PRPillarWriterTest >> resultWithRefWithoutAnchorWithSeparateOutputFiles [
	^ 'ref.pillar'
]

{ #category : #'requirement-InternalLinks' }
PRPillarWriterTest >> resultWithoutAliasWithoutRefWithAnchorWithSeparateOutputFiles [
	^ '@foo'
]

{ #category : #'requirement-InternalLinks' }
PRPillarWriterTest >> resultWithoutRefWithAnchorWithSeparateOutputFiles [
	^ '@foo'
]

{ #category : #requirements }
PRPillarWriterTest >> scriptAnchorForMyScript [
	^ 'label=myScript'
]

{ #category : #requirements }
PRPillarWriterTest >> scriptWithCaptionBegin [
	^ '[[['
]

{ #category : #requirements }
PRPillarWriterTest >> scriptWithoutCaptionBegin [
	^ '[[['
]

{ #category : #requirements }
PRPillarWriterTest >> strikethroughFoo [
	^ '--foo--'
]

{ #category : #requirements }
PRPillarWriterTest >> subscriptFoo [
	^ '@@foo@@'
]

{ #category : #requirements }
PRPillarWriterTest >> superscriptFoo [
	^ '^^foo^^'
]

{ #category : #tests }
PRPillarWriterTest >> supportSyntaxHighlighting [
	^ false
]

{ #category : #requirements }
PRPillarWriterTest >> tableBegin [
	^ '|'
]

{ #category : #requirements }
PRPillarWriterTest >> tableCellWithFoo [
	^ '|foo'
]

{ #category : #requirements }
PRPillarWriterTest >> tableCellWithHeadingFoo [
	^ '|!foo'
]

{ #category : #requirements }
PRPillarWriterTest >> tableRow [
	^ '|'
]

{ #category : #requirements }
PRPillarWriterTest >> termItemWithFoo [
	^ ';foo'
]

{ #category : #tests }
PRPillarWriterTest >> testAnnotation [
	| item |
	item := PRMockAnnotation withParameters: (
					PRParameters withAll: { 
						PRParameter 
							keyNode: (PRParameterKey named: 'value')
							valueNode: (PRParameterValue value: 'Foo').
						PRParameter 
							keyNode: (PRParameterKey named: 'number')
							valueNode: (PRParameterValue value: 5) }).
	self assertWriting: item includesText: '${mock:value=Foo|number=5}$'
]

{ #category : #tests }
PRPillarWriterTest >> testCitationAnnotation [

	| input |
	input := PRDocument new
		add:
			(PRCitationAnnotation new
				parameterAt: 'ref' put: 'foo';
				yourself).
	self assertWriting: input includesText: '${cite:ref=foo}$'
]

{ #category : #tests }
PRPillarWriterTest >> testCommentedLineNotVisibleInOutput [
	"in Pillar output, we really want our comments back"
]

{ #category : #tests }
PRPillarWriterTest >> testFigureWithoutLabelAndWithoutCaptionAreExportedWithoutEnvironment [
	self skip: 'no figure environment in pillar'
]

{ #category : #requirements }
PRPillarWriterTest >> underlineFoo [
	^ '__foo__'
]

{ #category : #requirements }
PRPillarWriterTest >> unorderedListBegin [
	^ '-'
]
