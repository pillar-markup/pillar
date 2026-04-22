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
	"onlyCHeckers" : [ "Vocabulary" , "EnglishTypography" ],
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
