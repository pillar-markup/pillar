"
Pillar is a system to produce documents (latex, html, markdown....) from a wiki like syntax named pillar. 
More information in https://github.com/pillar-markup/pillar.

Usage: 
A typical example is 
	pillar archetype book 
		to install an archetype
	pillar build pdf
	pillar build html 
		to build document in pdf or html
	
"
Class {
	#name : #PRCommandLineHandler,
	#superclass : #BasicCommandLineHandler,
	#category : #'Pillar-Cli-Handlers'
}

{ #category : #accessing }
PRCommandLineHandler class >> commandName [
	^ 'pillar'
]

{ #category : #testing }
PRCommandLineHandler class >> isResponsibleFor: aCommandLineArguments [
	^ aCommandLineArguments includesSubCommand: self commandName
]

{ #category : #private }
PRCommandLineHandler >> subCommandsRoot [
	^ PRSubCommandLineHandler
]
