Class {
	#name : #MicroDownSnippetFactory,
	#superclass : #Object,
	#category : #'Pillar-PetitMicroDown'
}

{ #category : #anchor }
MicroDownSnippetFactory >> anchorAreTrimedSample [
	^ self grammar anchorMarkup, '  test  '
]

{ #category : #anchor }
MicroDownSnippetFactory >> anchorSample [
	^ self grammar anchorMarkup, 'test'
]

{ #category : #anchor }
MicroDownSnippetFactory >> anchorWithNewLineSample [
	^ self grammar anchorMarkup, 'foo', String cr
]

{ #category : #anchor }
MicroDownSnippetFactory >> anchorWithSpaceInsideSample [
	^ self grammar anchorMarkup, 'foo bar'
]

{ #category : #format }
MicroDownSnippetFactory >> boldFormatEmptySample [
	^ self surround: '' withMarkup: self grammar boldMarkup
]

{ #category : #format }
MicroDownSnippetFactory >> boldFormatSample [
	^ self surroundWithMarkup: self grammar boldMarkup
]

{ #category : #'code block' }
MicroDownSnippetFactory >> codeblock: param [ 

	^ String streamContents: [ :st | 
		st nextPutAll: self grammar codeblockMarkup. 
		st nextPutAll: param.
		st cr.
		st nextPutAll: self grammar codeblockMarkup. 
	]
]

{ #category : #'code block' }
MicroDownSnippetFactory >> codeblock: param body: body [

	^ String streamContents: [ :st | 
		st nextPutAll: self grammar codeblockMarkup. 
		st nextPutAll: param.
		st cr.
		st nextPutAll: body.
		st cr.
		st nextPutAll: self grammar codeblockMarkup. 
	]
]

{ #category : #'code block' }
MicroDownSnippetFactory >> codeblockNoParamBody: body [

	^ String streamContents: [ :st | 
		st nextPutAll: self grammar codeblockMarkup. 
		st cr.
		st nextPutAll: body.
		st cr.
		st nextPutAll: self grammar codeblockMarkup. 
	]
]

{ #category : #utils }
MicroDownSnippetFactory >> grammar [

	^ PRMicroDownGrammar 
]

{ #category : #headers }
MicroDownSnippetFactory >> headerEmptySample [ 
	^ self grammar headerMarkup
]

{ #category : #headers }
MicroDownSnippetFactory >> headerLevel1Sample [
	^ self headerLevel: 1
]

{ #category : #headers }
MicroDownSnippetFactory >> headerLevel2Sample [

	^ self headerLevel: 2
]

{ #category : #headers }
MicroDownSnippetFactory >> headerLevel3Sample [

	^ self headerLevel: 3
]

{ #category : #headers }
MicroDownSnippetFactory >> headerLevel4Sample [

	^ self headerLevel: 4
]

{ #category : #headers }
MicroDownSnippetFactory >> headerLevel5Sample [

	^ self headerLevel: 5
]

{ #category : #headers }
MicroDownSnippetFactory >> headerLevel6Sample [

	^ self headerLevel: 6
]

{ #category : #headers }
MicroDownSnippetFactory >> headerLevel: n [

	^ String streamContents: [ :st |
		 n timesRepeat: [ st nextPutAll: self grammar headerMarkup ].
		 st nextPutAll: 'Foo']
]

{ #category : #headers }
MicroDownSnippetFactory >> headerWithFormatSample [
	^ self grammar headerMarkup, self boldFormatSample 
]

{ #category : #headers }
MicroDownSnippetFactory >> headerWithNewLineSample [
	^ self grammar headerMarkup, 'Foo', String cr
]

{ #category : #format }
MicroDownSnippetFactory >> italicFormatEmptySample [
	^ self surround: '' withMarkup: self grammar italicMarkup
]

{ #category : #format }
MicroDownSnippetFactory >> italicFormatSample [
	^ self surroundWithMarkup: self grammar italicMarkup
]

{ #category : #document }
MicroDownSnippetFactory >> lineEndSample [

	^  ''
]

{ #category : #document }
MicroDownSnippetFactory >> lineEndwithNewlineSample [

	^ String lf
]

{ #category : #list }
MicroDownSnippetFactory >> listMultiSample [
	| unordered |
	unordered := self grammar unorderedListMarkup.
	
	^ 	unordered, '1', String cr, 
		unordered, unordered, '2', String cr, 
		unordered, unordered, unordered, '3', String cr,
		unordered, unordered, '4', String cr,
		unordered, unordered, '5', String cr,	
		unordered, unordered, '6', String cr,
		unordered, '7', String cr,	
		unordered, '2. 8'
]

{ #category : #list }
MicroDownSnippetFactory >> listWithCommentSample [
	^ '1. Foo
%Comment
2. Bar'
]

{ #category : #format }
MicroDownSnippetFactory >> monospaceFormatEmptySample [
	^ self surround: '' withMarkup: self grammar monospaceMarkup
]

{ #category : #format }
MicroDownSnippetFactory >> monospaceFormatSample [
	^ self surroundWithMarkup: self grammar monospaceMarkup
]

{ #category : #document }
MicroDownSnippetFactory >> newlineCRLFSample [

	^ String crlf
]

{ #category : #document }
MicroDownSnippetFactory >> newlineCRSample [

	^ String cr
]

{ #category : #document }
MicroDownSnippetFactory >> newlineLFSample [

	^ String lf
]

{ #category : #document }
MicroDownSnippetFactory >> newlineSample [

	^ Smalltalk os lineEnding
]

{ #category : #list }
MicroDownSnippetFactory >> orderedListEmptySample [
	^ '1. '
]

{ #category : #list }
MicroDownSnippetFactory >> orderedListSample [
	^ '1. Foo'
]

{ #category : #list }
MicroDownSnippetFactory >> orderedListWithTwoItemsSample [
	
	^ 
'1. first
2. second
'
]

{ #category : #'code block' }
MicroDownSnippetFactory >> scriptParameterEscapeSample [
	^ 'value\==foo'
]

{ #category : #'code block' }
MicroDownSnippetFactory >> scriptParameterSample [
	^ 'value=foo'
]

{ #category : #'code block' }
MicroDownSnippetFactory >> scriptParameterTrueByDefaultSample [
	^ self codeblock: 'foo' body: 'bar'
	
]

{ #category : #'code block' }
MicroDownSnippetFactory >> scriptParameterValueSample [
	^ '=foo'
]

{ #category : #'code block' }
MicroDownSnippetFactory >> scriptParameterWithFloatSample [
	^ self codeblock: 'ratio=0.8' body: 'bar'
	
]

{ #category : #'code block' }
MicroDownSnippetFactory >> scriptParameterWithLiteralArraySample [
	^ self codeblock: 'foo=#(1 2 true)'
]

{ #category : #'code block' }
MicroDownSnippetFactory >> scriptParameterWithNoValuesSample [
	^ self codeblock: 'foo=' body: 'bar'

]

{ #category : #'code block' }
MicroDownSnippetFactory >> scriptParameterWithSpacesBeforeAndAfterSample [
	^ ' foo = true | bar = 2 
'
]

{ #category : #'code block' }
MicroDownSnippetFactory >> scriptParameterWithoutValueSample [
	^ 'foo'
]

{ #category : #'code block' }
MicroDownSnippetFactory >> scriptParametersEscapeSample [
	^ 'value=foo\||bar
'
]

{ #category : #'code block' }
MicroDownSnippetFactory >> scriptParametersMultipleSample [
	^ 'value=foo|bar
'
]

{ #category : #'code block' }
MicroDownSnippetFactory >> scriptParametersSample [
	^ 'value=foo
'
]

{ #category : #'code block' }
MicroDownSnippetFactory >> scriptSample [
	^ self codeblockNoParamBody: 'foo'
]

{ #category : #'code block' }
MicroDownSnippetFactory >> scriptTwoParametersNoValueSample [
	^ 'foo|bar
'
]

{ #category : #'code block' }
MicroDownSnippetFactory >> scriptWithLanguageSample [
	^ self codeblock: 'language=smalltalk' body: 'foo'
]

{ #category : #'code block' }
MicroDownSnippetFactory >> scriptWithNewLineSample [
	^ (self codeblockNoParamBody: 'foo'), String cr
]

{ #category : #'code block' }
MicroDownSnippetFactory >> scriptWithSpaceAtTheEndSample [
		
	 ^ (self codeblockNoParamBody: 'foo'), '  '.


]

{ #category : #'code block' }
MicroDownSnippetFactory >> scriptWithSpacedParametersSample [
	^ self codeblock:   ' foo = true | bar = 2 '
body: 'bla'
]

{ #category : #format }
MicroDownSnippetFactory >> strikethroughFormatEmptySample [
	^ self surround: '' withMarkup: self grammar strikethroughMarkup
]

{ #category : #format }
MicroDownSnippetFactory >> strikethroughFormatSample [
	^ self surroundWithMarkup: self grammar strikethroughMarkup
]

{ #category : #format }
MicroDownSnippetFactory >> subscriptFormatEmptySample [
	^ self surround: '' withMarkup: self grammar subscriptMarkup
]

{ #category : #format }
MicroDownSnippetFactory >> subscriptFormatSample [
	^ self surroundWithMarkup: self grammar subscriptMarkup
]

{ #category : #format }
MicroDownSnippetFactory >> superscriptFormatEmptySample [
	^ self surround: '' withMarkup: self grammar superscriptMarkup
]

{ #category : #format }
MicroDownSnippetFactory >> superscriptFormatSample [
	^ self surroundWithMarkup: self grammar superscriptMarkup
]

{ #category : #format }
MicroDownSnippetFactory >> surround: aWord withMarkup: aMarkup [
	^ (aMarkup, aWord, aMarkup) asString
]

{ #category : #format }
MicroDownSnippetFactory >> surroundWithMarkup: aMarkup [
	^ self surround: 'Foo' withMarkup: aMarkup
]

{ #category : #format }
MicroDownSnippetFactory >> underlineFormatEmptySample [
	^ self surround: '' withMarkup: self grammar underlineMarkup
]

{ #category : #format }
MicroDownSnippetFactory >> underlineFormatSample [
	^ self surroundWithMarkup: self grammar underlineMarkup
]

{ #category : #list }
MicroDownSnippetFactory >> unorderedListEmptySample [
	^ self grammar unorderedListMarkup
]

{ #category : #list }
MicroDownSnippetFactory >> unorderedListSample [
	^ self grammar unorderedListMarkup, 'Foo'
]

{ #category : #list }
MicroDownSnippetFactory >> unorderedListWithSubListSample [
	| listMarkup |
	listMarkup := self grammar unorderedListMarkup.
	^ listMarkup, 'Foo', String cr, listMarkup, listMarkup, 'Bar'
]

{ #category : #list }
MicroDownSnippetFactory >> unorderedListWithTwoItemsSample [
	| listMarkup |
	listMarkup := self grammar unorderedListMarkup.
	^ listMarkup, 'Foo', String cr, listMarkup, 'Bar'
]
