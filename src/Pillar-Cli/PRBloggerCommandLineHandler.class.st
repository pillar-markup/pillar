"
here is a typical example of the use of this command line

To build a book pdf
./pharo-ui Pillar.image pillar build pdf


To use a template
./pharo-ui Pillar.image pillar build --templatable html

To use a specific build strategy:
pillar build -a pdf >> build all Pillar documents found in directory
pillar build -m pdf >> default build, only index.pillar is build
NOTE: there is no flag for ""list"" as buildList is called only if files are given as positionals after format
"
Class {
	#name : 'PRBloggerCommandLineHandler',
	#superclass : 'PRSubCommandLineHandler',
	#category : 'Pillar-Cli-Handlers',
	#package : 'Pillar-Cli',
	#tag : 'Handlers'
}

{ #category : 'accessing' }
PRBloggerCommandLineHandler class >> commandName [
	^ 'blog'
]

{ #category : 'activation' }
PRBloggerCommandLineHandler >> activate [
	
	| blog | 
	blog := MicBlogCreator 
		createFrom: FileSystem workingDirectory / 'blogsrc' to: FileSystem workingDirectory / 'bloghtml'.
		
]

{ #category : 'activation' }
PRBloggerCommandLineHandler >> requestedBuilder [

	| nonOptions |
	"also managed ./pillar build book (to be backward compatible)"
	nonOptions := self arguments reject: [ :a | a beginsWith: '-' ].
	^ nonOptions
		ifNotEmpty: [ nonOptions first ]
		ifEmpty: [ self errorMissingParameter: 'template' ].
]

{ #category : 'activation' }
PRBloggerCommandLineHandler >> requestedFiles [

	| nonOptions |
	nonOptions := self arguments reject: [ :a | a beginsWith: '-' ].
	^ nonOptions allButFirst
]
