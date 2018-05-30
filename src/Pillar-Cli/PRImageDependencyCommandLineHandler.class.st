"
This pillar subcommand is about computing the dependent images of a given file. 

Usage: 
A typical example is 

	./pharo-ui Pillar.image pillar imageDependencies  --configurationFile=pillar.conf Chapters/Chapter1/chapter1.pillar
"
Class {
	#name : #PRImageDependencyCommandLineHandler,
	#superclass : #PRSubCommandLineHandler,
	#category : 'Pillar-Cli-Handlers'
}

{ #category : #accessing }
PRImageDependencyCommandLineHandler class >> commandName [
	^ 'imageDependencies'
]

{ #category : #activation }
PRImageDependencyCommandLineHandler >> activate [
	
	self command doIt
]

{ #category : #activation }
PRImageDependencyCommandLineHandler >> newCommand [
	
	^ PRDependencyCommand new forImages
]
