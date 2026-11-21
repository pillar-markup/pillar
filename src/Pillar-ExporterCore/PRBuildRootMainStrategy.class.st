"
I am the build strategy used when `pillar build <format>` names no file: I choose the file to build at the root of the book.

- `index.md` when it exists, whatever other Microdown files sit next to it (a style guide, notes...);
- otherwise the only Microdown (or Pillar) file of the root, ignoring the README of the repository (README.md, readme.md, ...);
- otherwise I raise a `PRCommandError`: no such file, or more than one, the user must name the file (`pillar build pdf book.md`).

`PRBuildListStrategy` is used when files are named.
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
	"Answer the file to build when the command names none: index.md at the root of aProject when it exists, whatever other Microdown files sit next to it (a style guide, notes...); otherwise the only Pillar or Microdown file of the root, ignoring the README of the repository (README.md, readme.md, ...). Raise a PRCommandError when there is no index.md and no such file or more than one."

	| index pillarFiles |
	index := aProject baseDirectory / 'index.md'.
	index isFile ifTrue: [
		^ { (self inputDocumentOn: index in: aProject) } ].
	pillarFiles := aProject baseDirectory children select: [ :each |
			               each isFile and: [
					               (self isSupportedExtension: each extension) and: [
						               (self isReadme: each) not ] ] ].
	pillarFiles ifEmpty: [
			PRCommandError signal:
				'There is no Microdown file (such as index.md) in the folder of the book: give the file to build, for example pillar build pdf index.md.' ].
	pillarFiles size = 1 ifTrue: [
		^ { (self inputDocumentOn: pillarFiles first in: aProject) } ].
	PRCommandError signal:
		('There is no index.md and more than one Microdown file in the folder of the book ({1}): give the one to build, for example pillar build pdf book.md.'
			 format:
			 { (', ' join:
				  (pillarFiles collect: [ :each | each basename ]) sorted) })
]

{ #category : 'private' }
PRBuildRootMainStrategy >> inputDocumentOn: aFile in: aProject [
	"Answer the input document of aFile, a file of aProject."

	^ (PRInputDocument forFile: aFile)
		  project: aProject;
		  yourself
]

{ #category : 'testing' }
PRBuildRootMainStrategy >> isReadme: aFileReference [
	"The README of a book repository presents the repository on GitHub; it is not part of the book."

	^ aFileReference basenameWithoutExtension asUppercase = 'README'
]
