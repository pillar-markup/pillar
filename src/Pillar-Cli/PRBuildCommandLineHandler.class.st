"
here is a typical example of the use of this command line

To build a book pdf
./pharo-ui Pillar.image pillar build pdf


To use a template
./pharo-ui Pillar.image pillar build --templatable html
"
Class {
	#name : #PRBuildCommandLineHandler,
	#superclass : #PRSubCommandLineHandler,
	#category : #'Pillar-Cli-Handlers'
}

{ #category : #accessing }
PRBuildCommandLineHandler class >> commandName [
	^ 'build'
]

{ #category : #activation }
PRBuildCommandLineHandler >> activate [
	
	| target result |
	target := PRTarget builderForName: self requestedBuilder.
	self requestedFiles
		ifEmpty: [ target buildAll ]
		ifNotEmpty: [ :files | target buildOnly: files ].
	(self hasOption: 'templatable')
		ifTrue: [ self project beTemplatable ].
	result := self project build: target.
	result exitProcess
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
