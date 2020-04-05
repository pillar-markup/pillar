Class {
	#name : #MicroDownSnippetFactory,
	#superclass : #Object,
	#category : #'Pillar-PetitMicroDown'
}

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
MicroDownSnippetFactory >> headerLevel1Sample [
	^ self grammar headerMarkup, '#Foo'
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
		 st nextPutAll: '#Foo']
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
