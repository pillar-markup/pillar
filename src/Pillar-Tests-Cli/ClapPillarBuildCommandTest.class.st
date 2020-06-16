Class {
	#name : #ClapPillarBuildCommandTest,
	#superclass : #TestCase,
	#category : #'Pillar-Tests-Cli'
}

{ #category : #tests }
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

{ #category : #running }
ClapPillarBuildCommandTest >> setUp [
	"Create a setup project with: index.pillar, a conf, and Chapters with Chap1 and Chap2"
	| workingDir |
	workingDir := FileSystem workingDirectory .
	workingDir / 'pillar.conf'
		writeStreamDo: [ :st | st nextPutAll: self configContent ].
]

{ #category : #running }
ClapPillarBuildCommandTest >> tearDown [
	(FileSystem workingDirectory / 'pillar.conf') delete.
]

{ #category : #adding }
ClapPillarBuildCommandTest >> testAddSubcommand [
	| allIds defaultCommand |
	defaultCommand := ClapPillarBuildCommand commandSpecification.
	allIds := PRTarget clapCommandList collect: [ :c | c identifier ].
	allIds do: 
		[ :id | 
			self assert: 
				(defaultCommand subcommands anySatisfy: 
					[ :c | c class = ClapCommand new class and: c identifier = id asSymbol]
			) 
		]
]

{ #category : #tests }
ClapPillarBuildCommandTest >> testDefaultCommandIsBuild [
	| defaultCommand |
	defaultCommand := ClapPillarBuildCommand commandSpecification.
	self assert: defaultCommand identifier equals: #build
]

{ #category : #tests }
ClapPillarBuildCommandTest >> testSameFlagsMainAndDefault [
	| defaultCommand mainCommand |
	defaultCommand := ClapPillarBuildCommand commandSpecification .
	mainCommand := (PRProject on: FileSystem workingDirectory) defaultTarget buildClapCommand.
	self assert: defaultCommand flags asString equals: mainCommand flags asString
]
