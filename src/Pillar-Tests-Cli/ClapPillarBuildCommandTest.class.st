Class {
	#name : 'ClapPillarBuildCommandTest',
	#superclass : 'TestCase',
	#instVars : [
		'memory'
	],
	#category : 'Pillar-Tests-Cli',
	#package : 'Pillar-Tests-Cli'
}

{ #category : 'running' }
ClapPillarBuildCommandTest >> configContent [
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
ClapPillarBuildCommandTest >> setUp [
	"Create a setup project with: index.pillar, a conf, and Chapters with Chap1 and Chap2"

	super setUp.
	memory := FileSystem memory.
	memory / 'pillar.conf' writeStreamDo: [ :st | st nextPutAll: self configContent ]
]

{ #category : 'running' }
ClapPillarBuildCommandTest >> tearDown [
	
	(memory / 'pillar.conf') delete.
	super tearDown
]

{ #category : 'tests - archetype specification' }
ClapPillarBuildCommandTest >> testArchetype [

	| context  |
	context := ClapPillarCommand commandSpecification activationWith: #(pillar archetype  'bod-book').
	self assert: context command requestedArchetype equals: 'bod-book'.
]

{ #category : 'tests - archetype specification' }
ClapPillarBuildCommandTest >> testEmptyArchetype [

	| context  |
	context := ClapPillarCommand commandSpecification activationWith: #(pillar archetype).
	self should: [ context command requestedArchetype ] raise: NotFound.
]

{ #category : 'test - building' }
ClapPillarBuildCommandTest >> testNewWayOf [

	| context command |
	context := ClapPillarBuildCommand commandSpecification activationWith: #(build '--format' pdf 'index.md').
	command := context command.
	self assert: command format equals: 'pdf'.
]
