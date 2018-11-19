"
Given information from the command line I manage dependency analysis.

I can be invoked as follow 
./pharo-ui Pillar.image fileDependencies  --configurationFile=pillar.conf Chapters/Chapter1/chapter1.pillar

but also from ur lovely system as

PRDependencyScripter new
	createConfiguration: 'pillar.conf' 
	baseDirectory:  FileSystem workingDirectory   
	argDictionary: {
			'inputFile'-> (FileSystem workingDirectory / 'Chapters/Chapter1/chapter1.pillar') } asDictionary;
	printDependencies
"
Class {
	#name : #PRDependencyCommand,
	#superclass : #PRAbstractCommand,
	#instVars : [
		'dependencyVisitor'
	],
	#category : 'Pillar-Cli-Model'
}

{ #category : #api }
PRDependencyCommand >> dependencies [
	| cache inputFile |
	cache := Set new.
	inputFile := baseDirectory resolve: self inputFile.
	cache addAll: (self dependencyVisitor start: (PRDocument parser parse: inputFile contents)).
	^ cache
]

{ #category : #private }
PRDependencyCommand >> dependencyVisitor [
	^ dependencyVisitor 
]

{ #category : #api }
PRDependencyCommand >> doIt [
	self printDependencies
]

{ #category : #api }
PRDependencyCommand >> forFiles [
	dependencyVisitor := PRFileDependencies new
]

{ #category : #api }
PRDependencyCommand >> forImages [
	dependencyVisitor := PRImageDependencies new
]

{ #category : #private }
PRDependencyCommand >> initialize [

	super initialize.
	self forFiles.
]

{ #category : #private }
PRDependencyCommand >> inputFile [
	^ configuration propertyAt: 'inputFile'
]

{ #category : #printing }
PRDependencyCommand >> printDependencies [
	| path pathWithoutFile |
	path := self inputFile pathString substrings: '/'.
	pathWithoutFile := path allButLast
		inject: ''
		into: [ :substring :next | substring , next , '/' ].
	Stdio stdout << 'Dependency analysis report: '.
	self dependencies
		do: [ :each | 
			Stdio stdout
				<< './';
				<< pathWithoutFile;
				<< each;
				<< ' ' ].
	Stdio stdout flush
]
