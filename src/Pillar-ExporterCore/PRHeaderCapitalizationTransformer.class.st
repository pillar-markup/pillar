Class {
	#name : #PRHeaderCapitalizationTransformer,
	#superclass : #PRPrintingTransformer,
	#instVars : [
		'headerCapitalization'
	],
	#category : #'Pillar-ExporterCore-Transformers'
}

{ #category : #default }
PRHeaderCapitalizationTransformer >> capitalizationConfiguration [

	^ Dictionary
		with: 'upper case' -> [ :text | text asUppercase ]
		with: 'lower case' -> [ :text | text asLowercase ]
		with: 'capitalize' -> [ :text | self capitalizeHeader: text ]
		with: 'capitalize english' -> [ :text | self capitalizeEnglish: text ]
		with: 'raw' -> [ :text | text ]
]

{ #category : #'visiting-document' }
PRHeaderCapitalizationTransformer >> capitalizeEnglish: aString [

	^ String streamContents: [ :s | 
		aString substrings 
			do: [ :each | s << (self englishWordCapitalize: each)]
			separatedBy: [ s << ' ']]
	
	

]

{ #category : #'visiting-document' }
PRHeaderCapitalizationTransformer >> capitalizeHeader: aString [
	
	^ String streamContents: [ :s | 
		aString substrings
			do: [ : each |  s << each capitalized]
			separatedBy: [ s  <<' ' ] ]
]

{ #category : #'visiting-document' }
PRHeaderCapitalizationTransformer >> englishWordCapitalize: aWord [

	^  (self nonCapitalizedWordEnglish includes: aWord)
					ifTrue: [ aWord ]
					ifFalse: [ aWord capitalized ]
					
	
	

]

{ #category : #initialization }
PRHeaderCapitalizationTransformer >> initialize [
	super initialize.
	headerCapitalization := 'raw'
]

{ #category : #default }
PRHeaderCapitalizationTransformer >> nonCapitalizedWordEnglish [

	^ #( 'to' 'and' 'or' 'an'  'a' 'of'  'the' 'but' 'nor'  'for' 'yet'  'so' 'on' 'at' 'in')
			

]

{ #category : #'visiting-document' }
PRHeaderCapitalizationTransformer >> visitHeader: aHeader [
	
	"this is done like that because the txt can be wrapped into bold and other"
	headerCapitalization := (self configuration printer levelConfigurationFor: aHeader) capitalization.
	super visitHeader: aHeader 
]

{ #category : #'visiting-document' }
PRHeaderCapitalizationTransformer >> visitText: aText [

	aText text: ((self capitalizationConfiguration at: headerCapitalization ifAbsent: [[:text|text]]) value: aText text).
	headerCapitalization := 'raw'
]
