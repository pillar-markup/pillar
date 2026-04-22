Class {
	#name : 'CheckerConfigurationTest',
	#superclass : 'TestCase',
	#category : 'Pillar-Cli-BookTester',
	#package : 'Pillar-Cli-BookTester'
}

{ #category : 'tests' }
CheckerConfigurationTest >> configurationOnlyAndConfigurations [

	^ ConfigurationForPillar newFromSTONDictionary: (STON fromString: '{
	"attribution" : "K. De Hondt, S. Ducasse with S. Jordan Montaño and E. Lorenzano",
	"keywords" : "Spec, user interface, Pharo, builder, widgets",
	"title" : "Application Building with Spec 2.0",
	"htmlWriter" : "html",
	"latexWriter" : "miclatex:sbabook",
	"tocFile": "index.md",
	"onlyCheckers" : [ "LastPeriodInParagraphLabel" ],
	"checkerConfigurations" : 
			[
			"LastPeriodInParagraphLabel" : {
					"isEndingWithPeriod" : true,
					"levelForParagraph" : 6
				},
			"LastPeriodInCode" : "true"
	]
}')
]

{ #category : 'tests' }
CheckerConfigurationTest >> configurationOnlyAndMissingConfiguration [

		^ ConfigurationForPillar newFromSTONDictionary: (STON fromString: '{
	"attribution" : "K. De Hondt, S. Ducasse with S. Jordan Montaño and E. Lorenzano",
	"keywords" : "Spec, user interface, Pharo, builder, widgets",
	"title" : "Application Building with Spec 2.0",
	"htmlWriter" : "html",
	"latexWriter" : "miclatex:sbabook",
	"tocFile": "index.md",
	"onlyCheckers" : [ "LastPeriodInParagraphLabel" ],
	"checkerConfigurations" : 
			[
			"XXXX" : {
					"isEndingWithPeriod" : true,
					"levelForPagraph" : 5
				},
			"LastPeriodInCode" : "true"
	]
}')
]

{ #category : 'tests' }
CheckerConfigurationTest >> testConfigurationHasABogusID [

	| checkers |
	checkers := MicAnalysisReportWriter checkersFromConfiguration:
		            self configurationOnlyAndMissingConfiguration.
	self assert: checkers size equals: 1.
	self
		assert: checkers first class checkerName
		equals: 'LastPeriodInParagraphLabel'.
	self
		assert: checkers first levelForParagraph
		equals: checkers first defaultLevelForParagraph
]

{ #category : 'tests' }
CheckerConfigurationTest >> testOnlyCheckerIsSelectedAndConfigured [

	| checkers |
	checkers := MicAnalysisReportWriter checkersFromConfiguration:
		            self configurationOnlyAndConfigurations.
	self assert: checkers size equals: 1.

	self
		assert: checkers first class checkerName
		equals: 'LastPeriodInParagraphLabel'.
	self
		assert: checkers first levelForParagraph 
		equals: 6
]
