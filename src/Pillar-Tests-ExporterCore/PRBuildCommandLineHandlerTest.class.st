Class {
	#name : #PRBuildCommandLineHandlerTest,
	#superclass : #TestCase,
	#instVars : [
		'project'
	],
	#category : #'Pillar-Tests-ExporterCore'
}

{ #category : #'as yet unclassified' }
PRBuildCommandLineHandlerTest >> chap1Content [
	^
	'
!!Compilation

Welcome to Pillar s little user-guide !!

To write a book, you can create chapters and include them into book.pillar
or directly edit the file.
If you do not know Pillar, check its documentation at *http://github.com/pillar-markup/pillar*.
'
]

{ #category : #'as yet unclassified' }
PRBuildCommandLineHandlerTest >> chap2Content [
	^
'
!!Edition and Templates

There is also a template system, you can find template in the folder _support/template.
Some template are already written, but if you want to have your own, you had two solutions:
-edit the existing template related to the format you want to change (recommanded)
-create your own template with its own name

'
]

{ #category : #'as yet unclassified' }
PRBuildCommandLineHandlerTest >> configContent [
	^ '{
  "base_url": "",
  "site_name": "Pharo Book",
  "title": "The Pillar Super Book Archetype",
  "attribution": "The Pillar team",
  "series": "Square Bracket tutorials",
  "keywords": "project template, Pillar, Pharo, Smalltalk",
  "language": "en-UK",
  "latexWriter" : #latex
}'
]

{ #category : #accessing }
PRBuildCommandLineHandlerTest >> indexContent [
	^
	'!My First book
		${inputFile:path=Chapters/Chapter1/chapter1.pillar}$
		${inputFile:path=Chapters/Chapter2/chapter2.pillar}$'
]

{ #category : #running }
PRBuildCommandLineHandlerTest >> setUp [
	| fileSystem |
	fileSystem := FileSystem memory root.
	fileSystem / 'index.pillar'
		writeStreamDo: [ :st | st nextPutAll: self indexContent ].
	fileSystem / 'pillar.conf'
		writeStreamDo: [ :st | st nextPutAll: self configContent ].
	(fileSystem / '_result' / 'pdf') ensureCreateDirectory.
	(fileSystem / 'Chapters' / 'Chapter1') ensureCreateDirectory
		/ 'chapter1.pillar'
		writeStreamDo: [ :st | st nextPutAll: self chap1Content ].
	(fileSystem / 'Chapters' / 'Chapter2') ensureCreateDirectory
		/ 'chapter2.pillar'
		writeStreamDo: [ :st | st nextPutAll: self chap2Content ].
	(FileSystem disk workingDirectory path / '_support') asFileReference
		copyAllTo: (fileSystem / '_support') ensureCreateDirectory asFileReference.
	project := PRProject new baseDirectory: fileSystem
]

{ #category : #tests }
PRBuildCommandLineHandlerTest >> testPRBuildStrategyRootMainStrategy [
	| target requestedFiles result |
	target := PRTarget builderForName: 'pdf'.
	requestedFiles := target buildMainRoot.
	result := project build: target.
	result exitProcess
]
