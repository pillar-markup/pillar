"
I'm a file strategy that identifies the pillar file on the root of the repository: i.e., index.pillar or book.pillar.

I (will be) used when the user types 
	pillar build pdf
"
Class {
	#name : 'PRBuildRootMainStrategy',
	#superclass : 'PRBuildStrategy',
	#category : 'Pillar-ExporterCore-Base',
	#package : 'Pillar-ExporterCore',
	#tag : 'Base'
}

{ #category : 'accessing' }
PRBuildRootMainStrategy >> filesToBuildOn: aProject [
	"Answer the only Pillar or Microdown file of the root of aProject, ignoring the README of the repository (README.md, readme.md, ...). Raise a PRCommandError when there is no such file or more than one."

	| pillarFiles |
	pillarFiles := aProject baseDirectory children select: [ :each |
			               each isFile and: [
					               (self isSupportedExtension: each extension) and: [
						               (self isReadme: each) not ] ] ].
	pillarFiles ifEmpty: [
			PRCommandError signal:
				'There is no Microdown file (such as index.md) in the folder of the book: give the file to build, for example pillar build pdf index.md.' ].
	pillarFiles size = 1 ifTrue: [
			^ { ((PRInputDocument forFile: pillarFiles first)
				   project: aProject;
				   yourself) } ].
	PRCommandError signal:
		('There is more than one Microdown file in the folder of the book ({1}): give the one to build, for example pillar build pdf index.md.'
			 format:
			 { (', ' join:
				  (pillarFiles collect: [ :each | each basename ]) sorted) })
]

{ #category : 'testing' }
PRBuildRootMainStrategy >> isReadme: aFileReference [
	"The README of a book repository presents the repository on GitHub; it is not part of the book."

	^ aFileReference basenameWithoutExtension asUppercase = 'README'
]
