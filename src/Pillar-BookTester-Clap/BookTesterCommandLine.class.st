Class {
	#name : #BookTesterCommandLine,
	#superclass : #Object,
	#instVars : [
		'arguments'
	],
	#category : 'Pillar-BookTester-Clap'
}

{ #category : #'command line' }
BookTesterCommandLine class >> checkFile [
	<commandline>

	^ (ClapCommand withName: #checkFile)
		description: 'Checks the examples and the correct compilation of methods and classes defined in the chapter (pillar file)';
		add: ClapFlag forHelp;
		addPositional: ((ClapPositional withName: 'path') 
		   defaultMeaning: [ (FileSystem workingDirectory childrenMatching: '*.pillar') first  ];
			description: 'Path to the targetted chapter. 
							  Default: first *.pillar in the current directory');
		"the default positional is index/pillar in the current directory"
		meaning: [ :args | 
			args atName: 'help' ifFound: [ :help |
				help value; exitSuccess ].
			
				(self with: args) checkFile	] 
]

{ #category : #'instance creation' }
BookTesterCommandLine class >> with: arguments [

		^ self new
		setArguments: arguments;
		yourself
]

{ #category : #running }
BookTesterCommandLine >> checkFile [
	
	self 
		checkFile: (arguments atName: 'path') value
		on: (VTermOutputDriver on: arguments context stdout)
]

{ #category : #running }
BookTesterCommandLine >> checkFile: aBookPath on: aStream [

	| bTester |
	bTester := PRBookTesterVisitor new.
	bTester checkAndReportFileNamed: aBookPath.
	aStream << (aBookPath fullName).
	aStream lf.
	aStream << 'Passed: ' << ((bTester allTestResults size - bTester failedTests size) 
									  asString) ; lf.
	aStream << 'Failed: ' << (bTester failedTests size asString);lf;lf. 
	bTester failedTests do: [ :each | 
								    	aStream << (each explanation);lf.
									   aStream << (each text);lf;lf ].
	aStream << 'File tested!';lf;lf
			  
]

{ #category : #initializing }
BookTesterCommandLine >> setArguments: args [

	arguments := args
]
