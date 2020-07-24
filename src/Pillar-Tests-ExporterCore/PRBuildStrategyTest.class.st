Class {
	#name : #PRBuildStrategyTest,
	#superclass : #TestCase,
	#instVars : [
		'project'
	],
	#category : #'Pillar-Tests-ExporterCore-Base'
}

{ #category : #'as yet unclassified' }
PRBuildStrategyTest >> chap1Content [
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
PRBuildStrategyTest >> chap2Content [
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
PRBuildStrategyTest >> configContent [
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
PRBuildStrategyTest >> indexContent [
	^
	'!My First book
		${inputFile:path=Chapters/Chapter1/chapter1.pillar}$
		${inputFile:path=Chapters/Chapter2/chapter2.pillar}$'
]

{ #category : #running }
PRBuildStrategyTest >> setUp [
	"Create a setup project with: index.pillar, a conf, and Chapters with Chap1 and Chap2"

	| fileSystem |
	super setUp.
	fileSystem := FileSystem memory root.
	fileSystem / 'index.pillar' writeStreamDo: [ :st | st nextPutAll: self indexContent ].
	fileSystem / 'pillar.conf' writeStreamDo: [ :st | st nextPutAll: self configContent ].
	(fileSystem / 'Chapters' / 'Chapter1') ensureCreateDirectory / 'chapter1.pillar' writeStreamDo: [ :st | st nextPutAll: self chap1Content ].
	(fileSystem / 'Chapters' / 'Chapter2') ensureCreateDirectory / 'chapter2.pillar' writeStreamDo: [ :st | st nextPutAll: self chap2Content ].
	project := PRProject new baseDirectory: fileSystem
]

{ #category : #tests }
PRBuildStrategyTest >> testPRBuildAllStrategy [
	| f |
	f := PRBuildAllStrategy new filesToBuildOn: project.
	self assert: f size equals: 3.
	self
		assert: f first file fullName
		equals: '/Chapters/Chapter1/chapter1.pillar'.
	self
		assert: f second file fullName
		equals: '/Chapters/Chapter2/chapter2.pillar'.
	self assert: f third file fullName equals: '/index.pillar'
]

{ #category : #tests }
PRBuildStrategyTest >> testPRBuildListStrategy [
	| f |
	f := PRBuildListStrategy new
		files: {'index.pillar' . 'chapter1.pillar'}.
	f := f filesToBuildOn: project.
	self assert: f size equals: 2.
	self assert: ((f collect: [:each | each fullName]) 
							includesAll: #('/index.pillar' '/chapter1.pillar')).
]

{ #category : #tests }
PRBuildStrategyTest >> testPRBuildListStrategyDoubleEntry [
	| f |
	f := PRBuildListStrategy new
		files: {'chapter1.pillar' . 'chapter1.pillar'}.
	f := f filesToBuildOn: project.
	self assert: f size equals: 1.
	self assert: f anyOne file fullName equals: '/chapter1.pillar'
]

{ #category : #tests }
PRBuildStrategyTest >> testPRBuildRootMainStrategy [
	| f |
	f := PRBuildRootMainStrategy new filesToBuildOn: project.
	self assert: f size equals: 1.
	self assert: f first file fullName equals: '/index.pillar'
	
]
