"
This suite of tests are about the specification of a command. 

It does not verify the execution of the command.
"
Class {
	#name : 'ClapPillarBuildCommandSpecTest',
	#superclass : 'TestCase',
	#instVars : [
		'memory'
	],
	#category : 'Pillar-Tests-Cli-Clap',
	#package : 'Pillar-Tests-Cli',
	#tag : 'Clap'
}

{ #category : 'running' }
ClapPillarBuildCommandSpecTest >> configContent [
	^ '{
  "title": "The Pillar Super Book Archetype",
  "attribution": "The Pillar team",
  "series": "Square Bracket tutorials",
  "keywords": "project template, Pillar, Pharo, Smalltalk",
  "language": "en-UK",
  "epub-id": "urn:uuid:A1B0D67E-2E81-4DF5-9E67-A64CBE366809",
  "defaultExport": "pdf",
  
  "latexTemplate": "main.latex.mustache",
  "htmlTemplate": "html.mustache",
  "latexWriter" : #''latex:sbabook'',
  "htmlWriter": #html
}'
]

{ #category : 'running' }
ClapPillarBuildCommandSpecTest >> setUp [
	"Create a setup project with: index.pillar, a conf, and Chapters with Chap1 and Chap2"

	super setUp.
	memory := FileSystem memory.
	memory / 'pillar.conf' writeStreamDo: [ :st | st nextPutAll: self configContent ]
]

{ #category : 'running' }
ClapPillarBuildCommandSpecTest >> tearDown [
	
	(memory / 'pillar.conf') delete.
	super tearDown
]

{ #category : 'tests - files' }
ClapPillarBuildCommandSpecTest >> testAll [

	| context command |
	context := ClapPillarBuildCommand commandSpecification activationWith: #(build pdf '--all').
	command := context command.
	self assert: (command hasFlag: 'all').
]

{ #category : 'tests - files' }
ClapPillarBuildCommandSpecTest >> testExplicitFile [

	| context command |
	context := ClapPillarBuildCommand commandSpecification activationWith: #(build '--format' pdf 'index.md').
	command := context command.
	self assert: command requestedFiles asArray equals: #('index.md')
]

{ #category : 'tests - files' }
ClapPillarBuildCommandSpecTest >> testExplicitFileDifferentFromIndex [

	| context command |
	context := ClapPillarBuildCommand commandSpecification activationWith: #(build  pdf 'toto.md').
	command := context command.
	self assert: command requestedFiles asArray equals: #('toto.md')
]

{ #category : 'tests - files' }
ClapPillarBuildCommandSpecTest >> testExplicitFiles [

	| context command |
	context := ClapPillarBuildCommand commandSpecification activationWith: #(build pdf 'index.md' 'titi.md').
	command := context command.
	self assert: command requestedFiles asArray equals: #('index.md' 'titi.md')
]

{ #category : 'tests - format' }
ClapPillarBuildCommandSpecTest >> testFormatPdf [

	| context command |
	context := ClapPillarBuildCommand commandSpecification activationWith: #(build pdf).
	command := context command.
	self assert: command format equals: 'pdf'.
]

{ #category : 'tests - format' }
ClapPillarBuildCommandSpecTest >> testFormatUnknownFormat [

	| context command |
	context := ClapPillarBuildCommand commandSpecification activationWith: #(build '--pilou' pdf 'index.md').
	command := context command.
	self should: [ command format ] raise: NotFound.
	[ command format ] on: NotFound do: [ :ex | self assert: ex messageText equals: 'Cannot find format!' ]
]

{ #category : 'tests - format' }
ClapPillarBuildCommandSpecTest >> testNoExplicitFileMeansIndexDotMD [

	| context command |
	context := ClapPillarBuildCommand commandSpecification activationWith: #(build '--format' pdf).
	command := context command.
	self assert: command requestedFiles asArray equals: #('index.md')
]
