Class {
	#name : #MicroDownSnippetFactory,
	#superclass : #Object,
	#category : #'Pillar-PetitMicroDown'
}

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
MicroDownSnippetFactory >> scriptSample [
	^ String streamContents: [ :st | 
		st nextPutAll: self grammar codeblockMarkup. 
		st cr.
		st nextPutAll: 'foo'.
		st cr.
		st nextPutAll: self grammar codeblockMarkup. 
	]
]
