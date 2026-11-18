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
	"Answer the only Pillar or Microdown file of the root of aProject, ignoring the README of the repository (README.md, readme.md, ...). Raise an error when there is no such file or more than one."

	| pillarFiles |
	pillarFiles := aProject baseDirectory children select: [ :each |
			               each isFile and: [
					               (self isSupportedExtension: each extension) and: [
						               (self isReadme: each) not ] ] ].
	pillarFiles ifEmpty: [
			self error:
				'There is no pillar (md or pillar) file in the repository root.' ].
	pillarFiles size = 1 ifTrue: [
			^ { ((PRInputDocument forFile: pillarFiles first)
				   project: aProject;
				   yourself) } ].
	self error:
		'There is more than one pillar file in the repository root.'
]

{ #category : 'testing' }
PRBuildRootMainStrategy >> isReadme: aFileReference [
	"The README of a book repository presents the repository on GitHub; it is not part of the book."

	^ aFileReference basenameWithoutExtension asUppercase = 'README'
]
