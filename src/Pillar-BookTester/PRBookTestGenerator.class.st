"
This visitor generates tests based on the information in the >>> expression. 
"
Class {
	#name : #PRBookTestGenerator,
	#superclass : #PRBookTesterVisitor,
	#instVars : [
		'fileName',
		'cbIndex',
		'resultPackage'
	],
	#category : #'Pillar-BookTester-Visitor'
}

{ #category : #visiting }
PRBookTestGenerator >> checkAndReportFileNamed: aPath [
	
	self fileName: (self prettyRename: aPath).
	self createClassFrom: fileName.
	super checkAndReportFileNamed: aPath
	
		
]

{ #category : #accessing }
PRBookTestGenerator >> codeBlockIndex [

	^ cbIndex
]

{ #category : #accessing }
PRBookTestGenerator >> codeBlockIndex: aCodeblockCounter [

	cbIndex := aCodeblockCounter
]

{ #category : #visiting }
PRBookTestGenerator >> createClassFrom: aPrettyFileName [

	TestCase subclass: aPrettyFileName 
   		instanceVariableNames: ''
    	classVariableNames: ''
    	package: resultPackage
		
]

{ #category : #visiting }
PRBookTestGenerator >> createTestMethodFrom: aCodeblock [
	"The test method is compiled using the following template, either it raises no exception:
	test(cbIndex)
	
		self assert: (ourAssociation) isPaired
	
	or it raises one:
	test(cbIndex)
	
		self assert: false description: [ theCodeBlock test raised the exception: (theException) ]"

	[ (self class environment at: fileName asSymbol)
		compile:
			'test' , cbIndex asString
				,
					'
	
	self assert: (' , aCodeblock textForExample withSeparatorsCompacted
				, ') isPaired' 
		classified: 'Compiled ok tests' ]
		on: Exception
		do: [ :e | 
			(self class environment at: fileName asSymbol)
				compile:
					(String
						streamContents: [ :s | 
							s << 'test' << cbIndex asString.
							s
								cr;
								cr;
								tab.
							s
								<< 'self assert: Error signal description: ''A code block failed''. '.
							s
								cr;
								tab.
							s << '"' << e class name << ' was raised with: '
								<< (e messageText copyWithout: $") << '"'.
							s
								cr;
								tab.
							s << '"' << 'by the codeblock: '
								<< (aCodeblock textForExample withSeparatorsCompacted copyWithout: $")
								<< '"' ])
					classified: 'Broken book tests' ]
]

{ #category : #accessing }
PRBookTestGenerator >> fileName [

	^ fileName
]

{ #category : #accessing }
PRBookTestGenerator >> fileName: aFileName [

	fileName := aFileName
]

{ #category : #visiting }
PRBookTestGenerator >> initialize [

	super initialize.
	self codeBlockIndex: 0.
	resultPackage := 'Pillar-BookTesterResults-Books'.
]

{ #category : #accessing }
PRBookTestGenerator >> prettyRename: aPath [

	| basename |
	basename := aPath asFileReference basename.
	^ 'PRT', ((basename first asString capitalized), basename allButFirst) withoutPeriodSuffix
]

{ #category : #visiting }
PRBookTestGenerator >> resultPackage [

	^ resultPackage
]

{ #category : #visiting }
PRBookTestGenerator >> resultPackage: aPackageName [

	resultPackage := aPackageName
]

{ #category : #visiting }
PRBookTestGenerator >> visitCodeblock: aCodeblock [

	aCodeblock isEvaluated
		ifTrue: [ self evaluate: aCodeblock ]
		ifFalse: [ aCodeblock isExample
							ifTrue: [ self codeBlockIndex: cbIndex+1.
				 			 self createTestMethodFrom: aCodeblock ]]
]
