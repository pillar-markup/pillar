"
here is a typical example of the use of this command line

./pharo-ui Pillar.image pillar export --to=""latex"" Chapters/Chapter1/chapter1.pillar
"
Class {
	#name : #PRBuildCommandLineHandler,
	#superclass : #PRSubCommandLineHandler,
	#category : 'Pillar-Cli-Handlers'
}

{ #category : #accessing }
PRBuildCommandLineHandler class >> commandName [
	^ 'build'
]

{ #category : #activation }
PRBuildCommandLineHandler >> activate [
	
	| target |
	target := PRTarget builderForName: self requestedBuilder.
	self requestedFiles
		ifEmpty: [ target buildAll ]
		ifNotEmpty: [ :files | target buildOnly: files ].
	self project build: target.
	self exitSuccess
]

{ #category : #activation }
PRBuildCommandLineHandler >> requestedBuilder [

	| nonOptions |
	"also managed ./pillar build book (to be backward compatible)"
	nonOptions := self arguments reject: [ :a | a beginsWith: '-' ].
	^ nonOptions
		ifNotEmpty: [ nonOptions first ]
		ifEmpty: [ self errorMissingParameter: 'template' ].
]

{ #category : #activation }
PRBuildCommandLineHandler >> requestedFiles [

	| nonOptions |
	nonOptions := self arguments reject: [ :a | a beginsWith: '-' ].
	^ nonOptions allButFirst
]
