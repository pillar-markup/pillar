Class {
	#name : #MicroDownSnippetFactory,
	#superclass : #Object,
	#category : #'Pillar-PetitMicroDown'
}

{ #category : #anchor }
MicroDownSnippetFactory >> anchorAreTrimedSample [
	^ (self grammarLineMarkup: PRAnchor), '  test  '
]

{ #category : #anchor }
MicroDownSnippetFactory >> anchorSample [
	^ (self grammarLineMarkup: PRAnchor) , 'test'
]

{ #category : #anchor }
MicroDownSnippetFactory >> anchorWithNewLineSample [
	^ (self grammarLineMarkup: PRAnchor) , 'foo', String cr
]

{ #category : #anchor }
MicroDownSnippetFactory >> anchorWithSpaceInsideSample [
	^ (self grammarLineMarkup: PRAnchor), 'foo bar'
]

{ #category : #format }
MicroDownSnippetFactory >> boldFormatEmptySample [
	^ self surround: '' withMarkup: (self grammarTextMarkup: PRBoldFormat) 
]

{ #category : #format }
MicroDownSnippetFactory >> boldFormatSample [
	^ self surroundWithMarkup: (self grammarTextMarkup: PRBoldFormat)
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

{ #category : #utils }
MicroDownSnippetFactory >> grammarLineMarkup: aPRClass [
	^ self grammar lineMarkups at: aPRClass
]

{ #category : #utils }
MicroDownSnippetFactory >> grammarTextMarkup: aPRClass [
	^ self grammar textMarkups at: aPRClass
]

{ #category : #headers }
MicroDownSnippetFactory >> headerEmptySample [ 
	^ self grammar headerMarkup asString
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
	^ self surround: '' withMarkup: (self grammarTextMarkup: PRItalicFormat) 
]

{ #category : #format }
MicroDownSnippetFactory >> italicFormatSample [
	^ self surroundWithMarkup: (self grammarTextMarkup: PRItalicFormat)
]

{ #category : #document }
MicroDownSnippetFactory >> lineEndSample [

	^  ''
]

{ #category : #document }
MicroDownSnippetFactory >> lineEndwithNewlineSample [

	^ String lf
]

{ #category : #format }
MicroDownSnippetFactory >> monospaceFormatEmptySample [
	^ self surround: '' withMarkup: (self grammarTextMarkup: PRMonospaceFormat) 
]

{ #category : #format }
MicroDownSnippetFactory >> monospaceFormatSample [
	^ self surroundWithMarkup: (self grammarTextMarkup: PRMonospaceFormat)
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
	^ self surround: '' withMarkup: (self grammarTextMarkup: PRStrikethroughFormat) 
]

{ #category : #format }
MicroDownSnippetFactory >> strikethroughFormatSample [
	^ self surroundWithMarkup: (self grammarTextMarkup: PRStrikethroughFormat)
]

{ #category : #format }
MicroDownSnippetFactory >> subscriptFormatEmptySample [
	^ self surround: '' withMarkup: (self grammarTextMarkup: PRSubscriptFormat) 
]

{ #category : #format }
MicroDownSnippetFactory >> subscriptFormatSample [
	^ self surroundWithMarkup: (self grammarTextMarkup: PRSubscriptFormat)
]

{ #category : #format }
MicroDownSnippetFactory >> superscriptFormatEmptySample [
	^ self surround: '' withMarkup: (self grammarTextMarkup: PRSuperscriptFormat) 
]

{ #category : #format }
MicroDownSnippetFactory >> superscriptFormatSample [
	^ self surroundWithMarkup: (self grammarTextMarkup: PRSuperscriptFormat)
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
	^ self surround: '' withMarkup: (self grammarTextMarkup: PRUnderlineFormat) 
]

{ #category : #format }
MicroDownSnippetFactory >> underlineFormatSample [
	^ self surroundWithMarkup: (self grammarTextMarkup: PRUnderlineFormat)
]

{ #category : #list }
MicroDownSnippetFactory >> unorderedListEmptySample [
	^ self grammarLineMarkup: PRUnorderedList
]

{ #category : #list }
MicroDownSnippetFactory >> unorderedListSample [
	^ (self grammarLineMarkup: PRUnorderedList) , 'Foo'
]

{ #category : #list }
MicroDownSnippetFactory >> unorderedListWithSubListSample [
	| listMarkup |
	listMarkup := self grammarLineMarkup: PRUnorderedList.
	^ listMarkup, 'Foo', String cr, listMarkup, listMarkup, 'Bar'
]

{ #category : #list }
MicroDownSnippetFactory >> unorderedListWithTwoItemsSample [
	| listMarkup |
	listMarkup := self grammarLineMarkup: PRUnorderedList.
	^ listMarkup, 'Foo', String cr, listMarkup, 'Bar'
]
