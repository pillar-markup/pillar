"
I'm a little util class that encapsulates writing reports about analyses.
"
Class {
	#name : 'MicAnalysisReportWriter',
	#superclass : 'Object',
	#instVars : [
		'results'
	],
	#category : 'Pillar-Cli-BookTester',
	#package : 'Pillar-Cli-BookTester'
}

{ #category : 'instance creation' }
MicAnalysisReportWriter class >> checkersFromConfiguration: aConfiguration [
	"Return all the checkers taking into account the configuration information."
	
	| availableCheckers configuredCheckers onlyCheckers |
	
	availableCheckers := Dictionary new.
	MicChecker allSubclasses
		do: [ :aClass |
			availableCheckers 
				at: aClass checkerName 
				put: aClass ].

	configuredCheckers := Dictionary new. 
	onlyCheckers := aConfiguration onlyCheckers.
	(onlyCheckers isNil or: [ onlyCheckers isEmpty ]) 
		ifFalse: [ 
			onlyCheckers do: [ :aCheck |
				availableCheckers 
					at: aCheck 
					ifAbsent: [ Stdio stdout nextPutAll: 'The checker ', aCheck asString , ' is not available'].
				configuredCheckers 
					at: aCheck 
					put: (availableCheckers at: aCheck) new].
				self 
					configureCheckers: configuredCheckers 
					from: aConfiguration.
				^ configuredCheckers values ].
		
	
	"Remove the checker the user does not want
	We will have to see the ones that are exclusive: FrenchTypo and EnglishTypo"	

	aConfiguration ignoredCheckers   
		do: [ :each | availableCheckers removeKey: each ifAbsent: [ ] ].

	
	availableCheckers keysAndValuesDo: [ :k :v | 
		[ configuredCheckers at: k put: v new] 
			on: Error 
			do: [  ] ].
	
	
	self 
		configureCheckers: configuredCheckers 
		from: aConfiguration.		
	^ configuredCheckers values
]

{ #category : 'instance creation' }
MicAnalysisReportWriter class >> configureCheckers: configuredCheckers from: aConfiguration [

	aConfiguration checkerConfigurations do: [ :each |
			configuredCheckers 
				at: each key
				ifPresent: [ :checker | 
					checker configureFrom: each value ] ].
]

{ #category : 'instance creation' }
MicAnalysisReportWriter class >> reportForFolder: folderReference 
	startingFrom: fileReference
	configuration: aConfiguration [
	"I perform several analyses starting from a root document file reference (e.g. index.md)"
		
	| reporter checkers |
	reporter := self new.

	checkers := self checkersFromConfiguration: aConfiguration.
	checkers do: [ :checker|
		Stdio stdout nextPutAll: 'Checker: ', checker class name, ' is checking.';cr.
		checker rootDirectory: folderReference.
		checker checkProject: fileReference.
		reporter addResults: checker results ].

	^ reporter
]

{ #category : 'adding' }
MicAnalysisReportWriter >> addResults: aCollection [

	results addAll: aCollection
]

{ #category : 'reporting' }
MicAnalysisReportWriter >> buildReportOn: str [ 

	| dict | 
	dict := results groupedBy: [ :each | each class ].
	dict keysAndValuesDo: [ :k :v | 
		str cr; nextPutAll: '## ' ;nextPutAll: k headerString; cr; cr.
		self reportElements: v on: str.
		str cr; cr.
		]
]

{ #category : 'reporting' }
MicAnalysisReportWriter >> buildReportSTONFormatOn: str [ 

	| dict list | 
	dict := results groupedBy: [ :each | each class ].
	dict keysAndValuesDo: [ :k :v | |array|
		array := Array new: 2.
		list := OrderedCollection new.
		self reportElementsSTONFormatOn: list.
		list := list asArray.
		array 
			at: 1 put: (Association new key: 'type' value: k errorType);
			at: 2 put: list.
		(String streamContents: [ :out | STON put: array onStream: str ])
		]
]

{ #category : 'initialization' }
MicAnalysisReportWriter >> initialize [

	super initialize. 
	results := OrderedCollection new
]

{ #category : 'testing' }
MicAnalysisReportWriter >> isOkay [

	^ results isEmpty
]

{ #category : 'reporting' }
MicAnalysisReportWriter >> report [

	^ String streamContents: [ :str |
		self buildReportOn: str
		]
]

{ #category : 'reporting' }
MicAnalysisReportWriter >> reportElements: partialResults on: aStream [

	partialResults 
		do: [ :each | aStream nextPutAll: '- '; nextPutAll: each explanation ] 
		separatedBy: [ aStream cr ]
	
]

{ #category : 'reporting' }
MicAnalysisReportWriter >> reportElementsOn: aStream [

	results 
		do: [ :each | aStream tab; nextPutAll: each explanation ] 
		separatedBy: [ aStream cr ]
	
]

{ #category : 'reporting' }
MicAnalysisReportWriter >> reportElementsSTONFormatOn: aList [

		results do: [ :each | aList add: each stonFormatExplanation ].
	
]

{ #category : 'reporting' }
MicAnalysisReportWriter >> reportSTONFormat [

	^ String streamContents: [ :str |
		self buildReportSTONFormatOn: str
		]
]

{ #category : 'accessing' }
MicAnalysisReportWriter >> results [

	^ results
]

{ #category : 'accessing' }
MicAnalysisReportWriter >> results: anObject [

	results := anObject
]
