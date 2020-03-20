Class {
	#name : #ProjectDefaultTargetTest,
	#superclass : #TestCase,
	#instVars : [
		'project'
	],
	#category : #'Pillar-Tests-Project'
}

{ #category : #'as yet unclassified' }
ProjectDefaultTargetTest >> configHTMLContent [
	^ '{
  "base_url": "",
  "site_name": "Pharo Book",
  "title": "The Pillar Super Book Archetype",
  "attribution": "The Pillar team",
  "series": "Square Bracket tutorials",
  "keywords": "project template, Pillar, Pharo, Smalltalk",
  "language": "en-UK",
  "latexWriter" : #latex,
  "defaultExport" : "html"
}'
]

{ #category : #'as yet unclassified' }
ProjectDefaultTargetTest >> configPDFContent [
	^ '{
  "base_url": "",
  "site_name": "Pharo Book",
  "title": "The Pillar Super Book Archetype",
  "attribution": "The Pillar team",
  "series": "Square Bracket tutorials",
  "keywords": "project template, Pillar, Pharo, Smalltalk",
  "language": "en-UK",
  "latexWriter" : #latex,
  "defaultExport" : "pdf"
}'
]

{ #category : #tests }
ProjectDefaultTargetTest >> testDefaultTargetHTML [
	| directory |
	directory := FileSystem memory root.
	directory / 'pillar.conf'
		writeStreamDo: [ :st | st nextPutAll: self configHTMLContent ].
	project := PRProject new baseDirectory: directory.
	
	self assert: project defaultTarget equals: PRHtmlOutput
]

{ #category : #tests }
ProjectDefaultTargetTest >> testDefaultTargetPDF [
	| directory |
	directory := FileSystem memory root.
	directory / 'pillar.conf'
		writeStreamDo: [ :st | st nextPutAll: self configPDFContent ].
	project := PRProject new baseDirectory: directory.
	
	self assert: project defaultTarget equals: PRPdfOutput
]
