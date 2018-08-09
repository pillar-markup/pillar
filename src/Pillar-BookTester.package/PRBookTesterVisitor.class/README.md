I am a visitor specialized in visiting books and testing their code. Therefore, I only redefine visitCodeBlock: and specify it with the different parameters the codelock may have.

I gather all results as PRBookTestResult s in allTestsResults.

visitCodeblock: uses executeAndReport: creating a PRBookTestResult with the result of the evaluation of the codeblock.

checkAndReportFileNamed: starts the visit in a given file.

Every codeblock can be specified with the following parameters implying a specialized visit:
- testcase: The codeblock is an example defined as follows, 
				[[[testcase=true
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
				[[[testcase=true
				(stimuli) >>> result
				]]]



