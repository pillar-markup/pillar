Class {
	#name : 'ConfigurationForPillarTest',
	#superclass : 'TestCase',
	#category : 'Pillar-Chrysal',
	#package : 'Pillar-Chrysal'
}

{ #category : 'as yet unclassified' }
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

{ #category : 'as yet unclassified' }
ConfigurationForPillarTest >> testCheckers [ 

	| configuration |
	
	configuration := ConfigurationForPillar newFromSTONDictionary: self configurationDictionary.
	self 
		assert: (configuration at: 'checkers')
		equals: #('Vocabulary' 'EnglishTypography')
	
		
	


]

{ #category : 'as yet unclassified' }
ConfigurationForPillarTest >> testCheckersConfiguration [

	| configuration |
	
	configuration := ConfigurationForPillar newFromSTONDictionary: self configurationDictionary.
	self 
		assert: (configuration at: 'checkerConfigurations') 
		equals: {'Vocabulary'->#(#('sub-presenter' 'subpresenter') #('sub presenter' 'subpresenter') #('meta object' 'metaobject'))}
	

]
