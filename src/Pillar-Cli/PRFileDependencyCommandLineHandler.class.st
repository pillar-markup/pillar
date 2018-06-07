"
This pillar subcommand is about computing the dependent files of a given file. 

Usage: 
A typical example is 

	./pharo-ui Pillar.image pillar fileDependencies  --configurationFile=pillar.conf Chapters/Chapter1/chapter1.pillar
"
Class {
	#name : #PRFileDependencyCommandLineHandler,
	#superclass : #PRSubCommandLineHandler,
	#category : 'Pillar-Cli-Handlers'
}

{ #category : #accessing }
PRFileDependencyCommandLineHandler class >> commandName [
	^ 'fileDependencies'
]

{ #category : #activation }
PRFileDependencyCommandLineHandler >> activate [
	
	self command doIt
]

{ #category : #activation }
PRFileDependencyCommandLineHandler >> newCommand [
	
	^ PRDependencyCommand new forFiles
]
