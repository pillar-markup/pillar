"
I write a document as XHTML for ePub
"
Class {
	#name : #PRXHTMLWriter,
	#superclass : #PRHTMLWriter,
	#category : 'Pillar-ExporterHTML'
}

{ #category : #accessing }
PRXHTMLWriter class >> fileExtension [
	^'xhtml'
]

{ #category : #accessing }
PRXHTMLWriter class >> writerName [
	^#xhtml
]

{ #category : #'visiting-document' }
PRXHTMLWriter >> templateForConfiguration: aConfiguration [
	
	^ aConfiguration propertyAt: 'epubTemplate' ifAbsent: [ '_support/templates/xhtml.mustache' ]
]

{ #category : #'visiting-document' }
PRXHTMLWriter >> visitCodeblock: aCodeBlock [
	canvas tag
		name: 'div';
		with: [ 
					canvas tag
						name: 'pre';
						with: [ 
									| code language |
									code := canvas tag
										name: 'code';
										yourself.
									language := self languageForScript: aCodeBlock.
									language isSyntaxHighlightingPossible
										ifTrue: [ code parameterAt: 'class' put: language printString ].
									code with: [ canvas lines: aCodeBlock text ] ].
					canvas tag
						name: 'span';
						with: [ 
									aCodeBlock hasLabel
										ifTrue: [ 
											self createAnchorWith: aCodeBlock label.
											self writeCounterForScript: aCodeBlock ].
									aCodeBlock hasCaption
										ifTrue: [ self visitAll: aCodeBlock caption children ] ] ].
	canvas newLine
]

{ #category : #'visiting-document' }
PRXHTMLWriter >> visitFigure: aFigure [

	self exportImgFor: aFigure.
]

{ #category : #'visiting-document' }
PRXHTMLWriter >> visitHeader: aHeader [
	canvas tag
		name: 'div';
		parameterAt: 'id' put: aHeader text asValidSelector;
		with: [ super visitHeader: aHeader ].
	canvas newLine
]

{ #category : #'visiting-document' }
PRXHTMLWriter >> visitStrikethroughFormat: aFormat [
	canvas tag
		name: 'span';
		parameterAt: 'class' put: 'striked';
		with: [ self visitFormat: aFormat ]
]

{ #category : #'visiting-document' }
PRXHTMLWriter >> visitUnderlineFormat: aFormat [
	canvas tag
		name: 'span';
		parameterAt: 'class' put: 'underline';
		with: [ self visitFormat: aFormat ]
]
