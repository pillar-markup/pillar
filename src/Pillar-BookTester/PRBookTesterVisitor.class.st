"
I am a visitor specialized in visiting books and testing their code. Therefore, I only redefine visitCodeBlock: and specify it with the different parameters the codeblock may have.

I gather all results as PRBookTestResults in the variable allTestsResults.

visitCodeblock: uses executeAndReport: creating a PRBookTestResult with the result of the evaluation of the codeblock.

checkAndReportFileNamed: starts the visit in a given file.

Every codeblock can be specified with the following parameters implying a specialized visit:
- example: The codeblock is an example defined as follows, 
				[[[example=true
				(stimuli) >>> result
				]]]
	
- methodDefinition: The codeblock is a method definition defined as follows,
				[[[methodDefinition=true
				ClassName >> methodName
					method body
				]]]
	
- classDefinition 
				[[[classDefinition=true
				Object subclass: #YourClass
					instanceVariableNames: 'iv1 iv2'
					classVariableNames: ''
					package: 'YourPackage'
				]]]
	
- evaluation
				[[[eval=true
				(stimuli) >>> result
				]]]


The process goes like that: 
- when I visit a code block I create a result which is annotated with a prepared version of the codeblock body.
- then depending on this preparation, I execute the code to validate it. 
- each type have a specific way of being validated.
- I report for each if is possible or not to check that the example provide the correct result, that the class 
definition can compile or that the method definition can compile. 

"
Class {
	#name : #PRBookTesterVisitor,
	#superclass : #PRVisitor,
	#instVars : [
		'allTestResults',
		'workingDirectory',
		'codeblockDict',
		'finalStatus'
	],
	#category : #'Pillar-BookTester-Visitor'
}

{ #category : #testing }
PRBookTesterVisitor class >> isAbstract [
	<ignoreForCoverage "This method is ignored for test coverage because it is overriden in all subclasses and these subclasses don't need to do a super-send.">
	^ false
]

{ #category : #accessing }
PRBookTesterVisitor >> allTestResults [
	
	^ allTestResults
]

{ #category : #accessing }
PRBookTesterVisitor >> allTestResults: anObject [

	allTestResults := anObject
]

{ #category : #'visiting-codeblock' }
PRBookTesterVisitor >> checkAndReportFileNamed: aPath [
	"The API we want to be using: 
	Visitor checkAndReportFileNamed: path"
	
	| text |
	text := (workingDirectory resolve: aPath) asFileReference readStreamDo: [:str | str contents].
	self start: (PRPillarParser new parse: text).
	self allTestResults do: [:each | self finalStatus: (self finalStatus & each status) ]
		

]

{ #category : #others }
PRBookTesterVisitor >> checkAssociation: aCodeBlock [
	"Asserts that the association created in any codeBlock has equal arguments"
	^ (self class compiler evaluate: aCodeBlock text) isPaired 

]

{ #category : #accessing }
PRBookTesterVisitor >> codeblockDict [
	
	^ codeblockDict
]

{ #category : #accessing }
PRBookTesterVisitor >> codeblockDict: aDictionary [

	codeblockDict := aDictionary
]

{ #category : #testing }
PRBookTesterVisitor >> compileClassSideMethod: aResult [

	| isCorrect |
	[((self class environment at: (((aResult fragmentedText first) first trimBoth) asSymbol)) class)
				compileSilently: (aResult fragmentedText second,'
	', aResult fragmentedText third) 
				classified: 'book tester'.
	isCorrect := true]
		on: Exception
		do: [ :ex | aResult explanation: ex asString.
						isCorrect := false ].
	^ isCorrect
	
]

{ #category : #testing }
PRBookTesterVisitor >> compileMethod: aResult [

	| isCorrect |
	[(self class environment at: (((aResult fragmentedText first) first trimBoth) asSymbol))
				compileSilently: (aResult fragmentedText second,'
	', aResult fragmentedText third)
				classified: 'book tester'.
	isCorrect := true]
		on: Exception
		do: [ :ex | aResult explanation: ex asString.
						isCorrect := false ].
	^ isCorrect
	
]

{ #category : #testing }
PRBookTesterVisitor >> compileWrongSyntaxMethodDefinition: aResult [

	| isCorrect |
	aResult explanation: aResult fragmentedText.
	isCorrect := false.
	^ isCorrect
	
]

{ #category : #evaluating }
PRBookTesterVisitor >> evaluate: aCodeBlock [

	^ aCodeBlock evaluate
]

{ #category : #compiling }
PRBookTesterVisitor >> executeAndReportClassDefinition: result [
	"Executes a codeblock with parameter classDefinition=true.
	It verifies the compilation occurs without raising any Error/Exception
	
	[[[classDefinition
	Object subclass: #Plop
		instanceVariableNames: 'iv1 iv2'
		classVariableNames: ''
		package: 'Pillar-BookTesterResults'
	]]]"

	| isCorrect |
	result explanation: 'Class did not compile without raising an exception'.
	isCorrect := false.
	[ self class evaluate: result text.
	isCorrect := true ]
		on: Exception
		do: [ :ex | 
			result explanation: ex asString.
			isCorrect := false ].
	result status: isCorrect.
	isCorrect
		ifTrue: [ result explanation: 'Class created' ]
]

{ #category : #compiling }
PRBookTesterVisitor >> executeAndReportExample: result [
	"Executes a codeblock with parameter example=true.
	To determine whether or not the test passed, this method creates an association as follows:
	[[[testcase
	3+4
	>>>7
	]]]
	is tested: 
	((3+4)>>>7) isPaired"
	
	| isCorrect |
	isCorrect := false.
	[ isCorrect := self checkAssociation: result ]
		on: Exception
		do: [ :ex | result explanation: ex asString ].
	result status: isCorrect.
	isCorrect
		ifTrue: [ result explanation: 'Test passed' ]
	
	
		

]

{ #category : #compiling }
PRBookTesterVisitor >> executeAndReportMethodDefinition: result [
	"Executes the method definition in the given class with the right name
	
	[[[methodDefinition
	Plop >> plop1
	^1
	]]]
	will define the method plop1 that returns 1 in the class Plop"
	
	| isCorrect typeString |
	result explanation: 'Method did not compile without raising an exception'.
	isCorrect := false.
	"The method definition can be either 'classSide', 'wrongSyntax' or 'normalMethodDefinition'"
	typeString := result characterizeMethodDefinition.
	typeString = 'wrongSyntax'
		ifTrue: [ isCorrect := self compileWrongSyntaxMethodDefinition: result ].
	typeString = 'classSide'
		ifTrue: [ isCorrect := self compileClassSideMethod: result ].
	typeString = 'normalMethodDefinition'
		ifTrue: [ isCorrect := self compileMethod: result ].
	result status: isCorrect.
	isCorrect ifTrue: [ result explanation: 'Method compiled' ]
]

{ #category : #testing }
PRBookTesterVisitor >> failedTests [
	"Returns the failed tests within the test results"
	^ allTestResults select: [ :each | each isFailed ]
]

{ #category : #accessing }
PRBookTesterVisitor >> finalStatus [

	^ finalStatus
]

{ #category : #accessing }
PRBookTesterVisitor >> finalStatus: anObject [

	finalStatus := anObject
]

{ #category : #initialization }
PRBookTesterVisitor >> initialize [
	super initialize.
	codeblockDict := { (#isEvaluated -> #evaluate:).
							(#isExample -> #visitCodeblockExample:).
							(#isMethodDefinition -> #visitCodeblockMethodDefinition:).
							(#isClassDefinition -> #visitCodeblockClassDefinition:)} asDictionary.
	allTestResults := OrderedCollection new.
	workingDirectory := FileLocator home.
	finalStatus := true
]

{ #category : #testing }
PRBookTesterVisitor >> validTests [
	"Returns all passed tests"
	^ allTestResults select: [ :each | each isValid ]
]

{ #category : #'visiting-codeblock' }
PRBookTesterVisitor >> visitCodeblock: aCodeBlock [

	codeblockDict keys
		do: [ :k | 
			(aCodeBlock perform: k)
				ifTrue: [ self perform: (codeblockDict at: k) with: aCodeBlock ] ]
]

{ #category : #'visiting-codeblock' }
PRBookTesterVisitor >> visitCodeblockClassDefinition: aCodeBlock [
	"Creates an instance of PRBookTestResult with parameters depending of the type of the codeblock. 
	Here it is for a class definition, it simply compiles the codeblock text"
	
	| result |
	self withPillarAuthorDo: [
		result := PRBookTestResult new.
		result text: aCodeBlock text.
		allTestResults add: result.
		self executeAndReportClassDefinition: result.
		aCodeBlock isExpectedFailure
			ifTrue: [ result status: result status not] ]
]

{ #category : #'visiting-codeblock' }
PRBookTesterVisitor >> visitCodeblockExample: aCodeBlock [
	"Creates an instance of PRBookTestResult with parameters depending of the type of the codeblock. 
	Here it is for an example and therefore uses the specialized exmple methods
	textForTestcase
	executeAndReportExample:
	Note that there is no fragmentedText here, no need for it b/ecause the codeblock text contains the whole text and is the equivalent of  Playground execution"
	
	| result |
	result := PRBookTestResult new.
	result text: aCodeBlock textForExample.
	allTestResults add: result.
	self executeAndReportExample: result.
	aCodeBlock isExpectedFailure
		ifTrue: [ result status: result status not] 
]

{ #category : #'visiting-codeblock' }
PRBookTesterVisitor >> visitCodeblockMethodDefinition: aCodeBlock [
	"Creates an instance of PRBookTestResult with parameters depending of the type of the codeblock. 
	Here it is for a test definition and therefore uses the specialized test definition methods
	textForMethodDefinition
	executeAndReportMethodDefinition:"
	
	| result |
	self withPillarAuthorDo: [
		result := PRBookTestResult new.
		result text: aCodeBlock text.
		result fragmentedText: aCodeBlock textForMethodDefinition.
		allTestResults add: result.
		self executeAndReportMethodDefinition: result.
		aCodeBlock isExpectedFailure
			ifTrue: [ result status: result status not] ]
]

{ #category : #'visiting-annotations' }
PRBookTesterVisitor >> visitLoaderAnnotation: aPRLoaderAnnotation [
	
	| projectName accountName tagName baselineName |
	projectName := aPRLoaderAnnotation project asString.
	accountName := aPRLoaderAnnotation account asString.
	tagName := aPRLoaderAnnotation gitTag asString.
	baselineName := aPRLoaderAnnotation baseline asString.
	
	self class environment at: #IceLibgitRepository ifPresent: [ :class |
		class registry
			detect: [ :any | any name = projectName ]
			ifFound: #delete. ].

	self class environment at: #IceRepository ifPresent: [ :class |
		class registry
			detect: [ :any | any name = projectName ]
			ifFound: [ :repo |
				repo loadedPackages do: #unload.
				MCRepositoryGroup default removeRepository: repo metacelloAdapter.
				repo forget] ].

	Metacello new
		baseline: baselineName;
		repository: 'github://', accountName,'/', projectName,':', tagName, '/src';
		onUpgrade: [ :ex | ex useIncoming ];
		onConflict: [ :err | err useIncoming ];
		load.
	
]

{ #category : #'visiting-annotations' }
PRBookTesterVisitor >> visitRunAnnotation: aPRRunAnnotation [
	"Todo visitor specification + exception handling"
	| testClass |
	testClass := ((aPRRunAnnotation parameters)at: #testClass) asSymbol.
	((self class environment) at: testClass) suite run passed 
								do: [ :each | |methodName| 
												  methodName := (each asString splitOn: '>>#') second.
												  self allTestResults add:
													(PRBookTestResult new 
													 explanation: 'Test passed';
													 text: testClass asString, '>>', 
															 (((self class environment) at: testClass) methodDict at: methodName asSymbol) definition;
													 status: true; yourself)].
	((self class environment) at: testClass) suite run failures 
								do: [ :each | |methodName| 
												  methodName := (each asString splitOn: '>>#') second. 
												  self allTestResults add:
													(PRBookTestResult new 
													 explanation: 'Test failed';
													 text: testClass asString, '>>', 
															 (((self class environment) at: testClass) methodDict at: methodName asSymbol) definition;
													 status: false; yourself)].
	((self class environment) at: testClass) suite run errors 
								do: [ :each | |methodName| 
												  methodName := (each asString splitOn: '>>#') second.
 												  self allTestResults add:
													(PRBookTestResult new 
													 explanation: 'Test errored';
													 text: testClass asString, '>>', 
															 (((self class environment) at: testClass) methodDict at: methodName asSymbol) definition;
													 status: false; yourself)].
	
	
]

{ #category : #compiling }
PRBookTesterVisitor >> withPillarAuthorDo: aBlock [

	Author
		useAuthor: 'Pillar'
		during: aBlock
]

{ #category : #accessing }
PRBookTesterVisitor >> workingDirectory [
	
	^ workingDirectory
	
]

{ #category : #accessing }
PRBookTesterVisitor >> workingDirectory: aDirectory [

	workingDirectory := aDirectory
	
]
