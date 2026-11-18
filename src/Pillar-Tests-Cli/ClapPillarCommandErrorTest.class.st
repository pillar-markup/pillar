"
I test how the pillar commands report errors: an error of the author (`PRCommandError` and the errors of Microdown about the book) prints `pillar: <message>`, any other error prints `pillar: internal error: …`, and both end the command with a failure, never with a stack trace. The errors are written into a stream instead of stderr.
"
Class {
	#name : 'ClapPillarCommandErrorTest',
	#superclass : 'TestCase',
	#instVars : [
		'errors'
	],
	#category : 'Pillar-Tests-Cli',
	#package : 'Pillar-Tests-Cli'
}

{ #category : 'helpers' }
ClapPillarCommandErrorTest >> commandFor: arguments [
	"Answer the command of the command line arguments, writing its errors into errors."

	^ (ClapPillarCommand commandSpecification activationWith: arguments)
		  command
		  errorStream: errors;
		  yourself
]

{ #category : 'helpers' }
ClapPillarCommandErrorTest >> report: anError [
	"Report anError as a command does, and answer the Exit it ends with."

	^ [
		  (self commandFor: #( pillar checkers )) reportError: anError.
		  nil ]
		  on: Exit
		  do: [ :exit | exit ]
]

{ #category : 'running' }
ClapPillarCommandErrorTest >> setUp [

	super setUp.
	errors := WriteStream on: String new
]

{ #category : 'tests' }
ClapPillarCommandErrorTest >> testBookStructureErrorIsAnErrorOfTheAuthor [

	self report: (MicInvalidBookStructure new messageText:
			 'paragraphLevel 2 must be deeper than chapterLevel 4').

	self
		assert: errors contents
		equals:
			'pillar: paragraphLevel 2 must be deeper than chapterLevel 4'
			, String lf
]

{ #category : 'tests' }
ClapPillarCommandErrorTest >> testCommandErrorPrintsItsMessage [

	self report:
		(PRCommandError new messageText: 'Unknown archetype nosuch.').

	self
		assert: errors contents
		equals: 'pillar: Unknown archetype nosuch.' , String lf
]

{ #category : 'tests' }
ClapPillarCommandErrorTest >> testErrorDuringACommandIsReported [

	| exit |
	exit := [
		        (self commandFor: #( pillar build foo )) executeOrPrintHelp.
		        nil ]
		        on: Exit
		        do: [ :each | each ].

	self deny: exit isSuccess.
	self assert: (errors contents beginsWith: 'pillar: ')
]

{ #category : 'tests' }
ClapPillarCommandErrorTest >> testInternalErrorNamesItsClassAndAsksForAReport [

	self report: (ZeroDivide new messageText: 'divided by zero').

	self assert: (errors contents beginsWith:
			 'pillar: internal error: ZeroDivide: divided by zero').
	self assert: (errors contents includesSubstring:
			 'https://github.com/pillar-markup/pillar/issues')
]

{ #category : 'tests' }
ClapPillarCommandErrorTest >> testMissingIncludedFileIsAnErrorOfTheAuthor [

	self report: (MicResourceReferenceError new messageText:
			 'The Microdown file at "x.md" is not found').

	self
		assert: errors contents
		equals:
		'pillar: The Microdown file at "x.md" is not found' , String lf
]

{ #category : 'tests' }
ClapPillarCommandErrorTest >> testReportedErrorEndsWithAFailure [

	self deny:
		(self report: (PRCommandError new messageText: 'wrong')) isSuccess
]
