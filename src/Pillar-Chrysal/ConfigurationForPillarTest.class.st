Class {
	#name : 'ConfigurationForPillarTest',
	#superclass : 'TestCase',
	#category : 'Pillar-Chrysal',
	#package : 'Pillar-Chrysal'
}

{ #category : 'helpers' }
ConfigurationForPillarTest >> configurationDictionary [

^ STONJSON fromString: '{
	"language" : "en-UK",
	"base_url" : "",
	"attribution" : "Stéphane Ducasse and Guillermo Polito",
	"keywords" : "Interpreters, languages, Pharo, Smalltalk",
	"title" : "Fun with Interpreters in Pharo",
	"series" : "The Pharo Booklet Collection — edited by S. Ducasse",
	"htmlWriter" : "html",
	"latexWriter" : "miclatex:sbabook",
	"bibFile" : "others.bib",
	"checkers" : [ "Vocabulary" , "EnglishTypography" ],
	"checkerConfigurations" : 
		[
		"Vocabulary" :
			[
				[
				"sub-presenter",
				"subpresenter"
				],
				[
				"sub presenter",
				"subpresenter"
				],
				[
				"meta object",
				"metaobject"
				]
		]
	]
}'

]

{ #category : 'helpers' }
ConfigurationForPillarTest >> configurationDictionaryWithIgnored [

^ STONJSON fromString: '{
	"language" : "en-UK",
	"base_url" : "",
	"attribution" : "Stéphane Ducasse and Guillermo Polito",
	"keywords" : "Interpreters, languages, Pharo, Smalltalk",
	"title" : "Fun with Interpreters in Pharo",
	"series" : "The Pharo Booklet Collection — edited by S. Ducasse",
	"htmlWriter" : "html",
	"latexWriter" : "miclatex:sbabook",
	"bibFile" : "others.bib",
	"onlyCheckers" : [  "EnglishTypography" ],
	"ignoredCheckers" : [ "FrenchTypography" ],
	"checkerConfigurations" : 
		[
		"Vocabulary" :
			[
				[
				"sub-presenter",
				"subpresenter"
				],
				[
				"sub presenter",
				"subpresenter"
				],
				[
				"meta object",
				"metaobject"
				]
		]
	]
}'

]

{ #category : 'tests' }
ConfigurationForPillarTest >> testCheckers [ 

	| configuration |
	configuration := ConfigurationForPillar newFromSTONDictionary: self configurationDictionaryWithIgnored.
	self 
		assert: configuration ignoredCheckers
		equals: #('FrenchTypography') asOrderedCollection .
	self 
		assert: configuration onlyCheckers
		equals: #('EnglishTypography') asOrderedCollection.

	
		
	


]

{ #category : 'tests' }
ConfigurationForPillarTest >> testCheckersConfiguration [

	| configuration |
	configuration := ConfigurationForPillar newFromSTONDictionary: self configurationDictionaryWithIgnored.
	self 
		assert: configuration checkerConfigurations 
		equals: {'Vocabulary' -> #(#('sub-presenter' 'subpresenter') #('sub presenter' 'subpresenter') #('meta object' 'metaobject'))} asOrderedCollection 
	

]

{ #category : 'tests' }
ConfigurationForPillarTest >> testIgnoredCheckers [

    | configuration |
	configuration := ConfigurationForPillar new.
	configuration ignoredCheckers: #( 'CheckerA' ).
	self assert: configuration ignoredCheckers size equals: 1.
   self assert: configuration ignoredCheckers first equals: 'CheckerA'.
]

{ #category : 'tests' }
ConfigurationForPillarTest >> testIgnoredandConfiguredCheckers [

    | configuration |
	configuration := ConfigurationForPillar new.
	configuration ignoredCheckers: #( 'CheckerA' ).
	configuration checkerConfigurations: #( #('CheckerB' 'yes') ).
	
	self assert: configuration ignoredCheckers size equals: 1.
   self assert: configuration ignoredCheckers first equals: 'CheckerA'.
	
	self assert: configuration checkerConfigurations size equals: 1.
    self assert: configuration checkerConfigurations first first equals: 'CheckerB'.
]

{ #category : 'tests' }
ConfigurationForPillarTest >> testOnlyCheckers [

    | configuration |
	configuration := ConfigurationForPillar new.
	configuration onlyCheckers: #( 'CheckerC' ).

	self assert: configuration onlyCheckers size equals: 1.
   self assert: configuration onlyCheckers first equals: 'CheckerC'.
]
