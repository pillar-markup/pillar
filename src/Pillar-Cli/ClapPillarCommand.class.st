"
I am the root of the pillar commands (`pillar build`, `pillar archetype`, `pillar updateArchetype`…), run by Clap from the command line. Each subclass declares its command with `commandSpecification` and does its work in `execute`, on the `PRProject` of the working directory (`project`).

I also report errors for all commands: `executeOrPrintHelp` catches any error raised by `execute`, writes it as one line on stderr (`reportError:`) and ends the command with a failure, instead of a stack trace.
- An error of the author (`authorErrorClasses`: `PRCommandError`, `MicInvalidBookStructure`, `MicResourceReferenceError`) prints `pillar: <message>`.
- Any other error is a bug of Pillar: it prints `pillar: internal error: <class>: <message>` and where to report it.

## Life cycle: who creates me and who uses me

1. Clap creates an instance of a subclass from the command line, using the specifications of `ClapPillarCommand class>>commandSpecification` and `pillarCommandsList`.
2. Clap sends it `executeOrPrintHelp`, which runs `execute` and reports its errors.

## Responsibility:

- Give each command its project and an output stream.
- Report the errors of all commands the same way.

## Collaborators: 

- `PRProject`: the book the commands work on.
- `PRCommandError`: the errors of the author.

## Examples

See the commands in `doc/commands.md` of the Pillar repository, e.g. `pillar build site`.
"
Class {
	#name : 'ClapPillarCommand',
	#superclass : 'ClapApplication',
	#instVars : [
		'project',
		'errorStream'
	],
	#category : 'Pillar-Cli-Clap',
	#package : 'Pillar-Cli',
	#tag : 'Clap'
}

{ #category : 'error handling' }
ClapPillarCommand class >> authorErrorClasses [
	"The errors caused by the request or the book of the author, reported with their message only."

	^ {
		  PRCommandError.
		  MicInvalidBookStructure.
		  MicResourceReferenceError }
]

{ #category : 'accessing' }
ClapPillarCommand class >> commandName [
	self subclassResponsibility
]

{ #category : 'command line' }
ClapPillarCommand class >> commandSpecification [
	<commandline>
	
	| command |
	command := (ClapCommandSpec id: #pillar)
		description: 'Pillar is a markup syntax and associated tools to write and generate documents lie books in PDF, websites in html, or slides';
		commandClass: self;
		addHelp;
		add: ((ClapFlag id: #version )
			description: 'Prints the version of your Pharo VM');	
		yourself.
	
	self pillarCommandsList do: [ :each | 
		command addSubcommand: each
		 ].
	 ^ command meaning: [ :args | 
		args at: #helpFlag ifPresent: [ :help | help value; exitSuccess ].
		args at: #version ifPresent: [ 
			| out |
			out := args context stdout.
			self printVersion: out ]
		]
]

{ #category : 'accessing' }
ClapPillarCommand class >> pillarCommandsList [
	^ self allSubclasses
		select: [ :each | each isAbstract not ]
		thenCollect: [ :each | each commandSpecification ]
]

{ #category : 'printing' }
ClapPillarCommand class >> printVersion: stream [
	stream newLine.
	stream newLine.
	stream nextPutAll: 'INFORMATION ABOUT VERSION'.
	stream newLine.
	stream newLine.
	stream nextPutAll: 'VM:    '; nextPutAll: Smalltalk vm version; cr.
	
	
	

		
	 
]

{ #category : 'error handling' }
ClapPillarCommand >> errorStream [
	"Answer where errors are written: stderr unless a test gave another stream."

	^ errorStream ifNil: [ self context stderr ]
]

{ #category : 'error handling' }
ClapPillarCommand >> errorStream: aStream [

	errorStream := aStream
]

{ #category : 'execution' }
ClapPillarCommand >> executeOrPrintHelp [
	"Run the command; report any error as one line for the author and end with a failure, instead of a stack trace."

	^ [ super executeOrPrintHelp ]
		  on: Error
		  do: [ :error | self reportError: error ]
]

{ #category : 'error handling' }
ClapPillarCommand >> isErrorOfTheAuthor: anError [
	"Answer whether anError comes from the request or the book of the author, not from a bug of Pillar."

	^ self class authorErrorClasses anySatisfy: [ :each |
		  each handles: anError ]
]

{ #category : 'error handling' }
ClapPillarCommand >> messageFor: anError [
	"Answer the message of an error of the author as it is; for any other error, a bug of Pillar, say what failed and where to report it."

	(self isErrorOfTheAuthor: anError) ifTrue: [ ^ anError messageText ].
	^ String streamContents: [ :stream |
			  stream
				  nextPutAll: 'internal error: ';
				  nextPutAll: anError class name;
				  nextPutAll: ': ';
				  nextPutAll: anError messageText asString;
				  lf;
				  nextPutAll:
					  'This is a bug of Pillar: please report it, with the command you ran, at https://github.com/pillar-markup/pillar/issues' ]
]

{ #category : 'accessing' }
ClapPillarCommand >> project [
	^ project ifNil: [ project := PRProject on: FileSystem workingDirectory  ]
]

{ #category : 'error handling' }
ClapPillarCommand >> reportError: anError [
	"Write anError on the error stream and end the command with a failure."

	self errorStream
		nextPutAll: 'pillar: ';
		nextPutAll: (self messageFor: anError);
		lf;
		flush.
	self context exitFailure
]
