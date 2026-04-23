Class {
	#name : 'CheckerConfigurationTest',
	#superclass : 'TestCase',
	#category : 'Pillar-Cli-BookTester',
	#package : 'Pillar-Cli-BookTester'
}

{ #category : 'tests' }
CheckerConfigurationTest >> configurationEmpty [
	^ ConfigurationForPillar newFromSTONDictionary: (STON fromString: '{
	"attribution" : "K. De Hondt, S. Ducasse with S. Jordan Montaño and E. Lorenzano",
	"keywords" : "Spec, user interface, Pharo, builder, widgets",
	"title" : "Application Building with Spec 2.0",
	"htmlWriter" : "html",
	"latexWriter" : "miclatex:sbabook",
	"tocFile": "index.md"
}')
]

{ #category : 'tests' }
CheckerConfigurationTest >> configurationIgnored [

	^ ConfigurationForPillar newFromSTONDictionary: (STON fromString: '{
	"attribution" : "K. De Hondt, S. Ducasse with S. Jordan Montaño and E. Lorenzano",
	"keywords" : "Spec, user interface, Pharo, builder, widgets",
	"title" : "Application Building with Spec 2.0",
	"htmlWriter" : "html",
	"latexWriter" : "miclatex:sbabook",
	"tocFile": "index.md",
	"ignoredCheckers" : [ "LastPeriodInParagraphLabel" , "LastPeriodInCode" ],
	"checkerConfigurations" : 
			[
			"LastPeriodInParagraphLabel" : {
					"isEndingWithPeriod" : true,
					"levelForParagraph" : 6
				},
			"LastPeriodInCode" : true,
			"LastPeriodInCaption" : true
			
	]
}')
]

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
			"LastPeriodInCode" : true
	]
}')
]

{ #category : 'tests' }
CheckerConfigurationTest >> configurationOnlyAndIgnored [

	^ ConfigurationForPillar newFromSTONDictionary: (STON fromString: '{
	"attribution" : "K. De Hondt, S. Ducasse with S. Jordan Montaño and E. Lorenzano",
	"keywords" : "Spec, user interface, Pharo, builder, widgets",
	"title" : "Application Building with Spec 2.0",
	"htmlWriter" : "html",
	"latexWriter" : "miclatex:sbabook",
	"tocFile": "index.md",
	"onlyCheckers" : [ "LastPeriodInParagraphLabel"  ],
	"ignoredCheckers" : [ "LastPeriodInParagraphLabel" , "LastPeriodInCode" ],
	"checkerConfigurations" : 
			[
			"LastPeriodInParagraphLabel" : {
					"isEndingWithPeriod" : true,
					"levelForParagraph" : 6
				},
			"LastPeriodInCode" : true
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
			"LastPeriodInCode" : true
	]
}')
]

{ #category : 'tests' }
CheckerConfigurationTest >> configurationTwoOnlyNoConfigureForFirst [

	^ ConfigurationForPillar newFromSTONDictionary: (STON fromString: '{
	"attribution" : "K. De Hondt, S. Ducasse with S. Jordan Montaño and E. Lorenzano",
	"keywords" : "Spec, user interface, Pharo, builder, widgets",
	"title" : "Application Building with Spec 2.0",
	"htmlWriter" : "html",
	"latexWriter" : "miclatex:sbabook",
	"tocFile": "index.md",
	"onlyCheckers" : [ "LastPeriodInParagraphLabel", "LastPeriodInCode" ],
	"checkerConfigurations" : 
			[
			"LastPeriodInCode" : true
			]
}')
]

{ #category : 'tests' }
CheckerConfigurationTest >> configurationWithBogusID [
	^ ConfigurationForPillar newFromSTONDictionary: (STON fromString: '{
	"attribution" : "K. De Hondt, S. Ducasse with S. Jordan Montaño and E. Lorenzano",
	"keywords" : "Spec, user interface, Pharo, builder, widgets",
	"title" : "Application Building with Spec 2.0",
	"htmlWriter" : "html",
	"latexWriter" : "miclatex:sbabook",
	"tocFile": "index.md",
	"checkerConfigurations" : 
			[
			"BogusCheckerName" : true,
			"LastPeriodInCode" : true
	]
}')
]

{ #category : 'tests' }
CheckerConfigurationTest >> testConfigurationHasABogusID [
	| checkers inCode |
	checkers := MicAnalysisReportWriter checkersFromConfiguration:
		            self configurationWithBogusID.
	self deny: checkers isEmpty.
	
	inCode := checkers select: [ :each | each class checkerName = 'LastPeriodInCode' ].
	self deny: inCode isEmpty.
	self assert: inCode first isEndingWithPeriod
]

{ #category : 'tests' }
CheckerConfigurationTest >> testEmptyConfigurationLoadsAllCheckers [
	| checkers allCheckers |
	checkers := MicAnalysisReportWriter checkersFromConfiguration:
		            self configurationEmpty.
		
	allCheckers := MicChecker allSubclasses select: [ :each |
		               each subclasses isEmpty ].
		
	self assert: checkers size equals: allCheckers size
]

{ #category : 'tests' }
CheckerConfigurationTest >> testIgnoredIsIndependent [

	| checkers allCheckers inCode inCaption |
	checkers := MicAnalysisReportWriter checkersFromConfiguration:
		            self configurationIgnored.
	allCheckers := MicChecker allSubclasses select: [ :each |
		               each subclasses isEmpty ].
	self assert: checkers size equals: allCheckers size - 2.

	
	inCode := checkers select: [ :each | each class checkerName = 'LastPeriodInCode' ].
	self assert: inCode isEmpty.
	
	inCaption := checkers select: [ :each | each class checkerName = 'LastPeriodInCaption' ].
	self assert: inCaption first isEndingWithPeriod
]

{ #category : 'tests' }
CheckerConfigurationTest >> testMultipleOnlyCheckers [

	| checkers twoCheckers |
	checkers := MicAnalysisReportWriter checkersFromConfiguration:
		            self configurationTwoOnlyNoConfigureForFirst.
	self assert: checkers size equals: 2.


	twoCheckers := #( 'LastPeriodInParagraphLabel'
	                  'LastPeriodInCode' ).
	self assert: 
		(twoCheckers includes: checkers first class checkerName).
	self assert:
		(twoCheckers includes: checkers second class checkerName)
]

{ #category : 'tests' }
CheckerConfigurationTest >> testMultipleOnlyCheckersSecondIsWellConfigured [

	| checkers |
	checkers := MicAnalysisReportWriter checkersFromConfiguration:
		            self configurationTwoOnlyNoConfigureForFirst.
	self assert: checkers size equals: 2.


	self
		assert: checkers first class checkerName
		equals: 'LastPeriodInCode'.
	self assert: checkers first isEndingWithPeriod.
	
	"the other only is not configured since there is no configuration"
	
	self assert: checkers second levelForParagraph equals: checkers second defaultLevelForParagraph 
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

{ #category : 'tests' }
CheckerConfigurationTest >> testOnlyPreemptsTheRest [

	| checkers |
	checkers := MicAnalysisReportWriter checkersFromConfiguration:
		            self configurationOnlyAndIgnored.
	self assert: checkers size equals: 1.
	self
		assert: checkers first class checkerName
		equals: 'LastPeriodInParagraphLabel'
]
