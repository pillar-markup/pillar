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
	#name : 'PRBookVerifierCommandLineHandler',
	#superclass : 'PRSubCommandLineHandler',
	#category : 'Pillar-Cli-Handlers',
	#package : 'Pillar-Cli',
	#tag : 'Handlers'
}

{ #category : 'accessing' }
PRBookVerifierCommandLineHandler class >> commandName [
	^ 'verify'
]

{ #category : 'activation' }
PRBookVerifierCommandLineHandler >> activate [
	
	| target result indexFile finder indexFileDoc resource allTrees  checker |
	target := PRTarget builderForName: 'checkBook'.
	indexFile := target filesToBuildOn: self project.
	indexFileDoc := (target documentFor: indexFile first) parseInputFile: indexFile first.
	
	
	"To be turned into an object for example the document resolver"
	resource := self project baseDirectory asMicResourceReference.
	"We resolved the path of the input so that after we know the exact files."
	resource resolveDocument: indexFileDoc. 
	finder := MicInputFileFinder new.
	finder visit: indexFileDoc. 
	allTrees := finder allFiles collect: [ :each | 
			| tree |
			tree := Microdown parseFile: each reference.
			resource resolveDocument: tree.
			tree ].
	checker := MicReferenceChecker new checkList: allTrees.
	
	
	Stdio stdout << 'Everything is perfect'.
	
	result exitProcess
]

{ #category : 'activation' }
PRBookVerifierCommandLineHandler >> requestedBuilder [

	| nonOptions |
	"also managed ./pillar build book (to be backward compatible)"
	nonOptions := self arguments reject: [ :a | a beginsWith: '-' ].
	^ nonOptions
		ifNotEmpty: [ nonOptions first ]
		ifEmpty: [ self errorMissingParameter: 'template' ].
]

{ #category : 'activation' }
PRBookVerifierCommandLineHandler >> requestedFiles [

	| nonOptions |
	nonOptions := self arguments reject: [ :a | a beginsWith: '-' ].
	^ nonOptions allButFirst
]
