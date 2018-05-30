"
For testing the menu in an HtmlDocument
"
Class {
	#name : #PRHtmlDocumentTest,
	#superclass : #TestCase,
	#instVars : [
		'project'
	],
	#category : 'Pillar-Tests-ExporterHTML'
}

{ #category : #tests }
PRHtmlDocumentTest >> createMustacheTemplateFile [
	| mustacheTemplate |
	mustacheTemplate := 'html.mustache' asFileReference.
	
	mustacheTemplate writeStreamDo: [ :stream |
		stream nextPutAll: 
'<!DOCTYPE html>
<html>
	<head>
		<title>{{site_name}}</title>
	</head>
	<body>
		<div class="row">
			<div class="col-xs-12 col-md-4 section-heading">
				{{# toc}}
					{{name}}
 						{{#children}}
							<h1>{{name}}</h1>
						{{/children}}
				{{/ toc}}
			</div>
			
			<div class="col-xs-12 col-md-8">
				{{{content}}}
			</div>
		</div>
	</body>
</html>'
		 ]
]

{ #category : #tests }
PRHtmlDocumentTest >> createPillarConfFile [
	| pillarConf |
	pillarConf := 'pillar.conf' asFileReference.
	
	pillarConf writeStreamDo: [ :stream |
		stream nextPutAll: '{
  "title": "The Pillar Super Book Archetype",
  "attribution": "The Pillar team",
  "series": "Square Bracket tutorials",
  "keywords": "project template, Pillar, Pharo, Smalltalk",
  "language": "en-UK",
  "epub-id": "urn:uuid:A1B0D67E-2E81-4DF5-9E67-A64CBE366809",
  
  "latexTemplate": "main.latex.mustache",
  "htmlTemplate": "html.mustache",
  "latexWriter" : #''latex:sbabook'',
  "htmlWriter": #html
}'
		 ]
]

{ #category : #tests }
PRHtmlDocumentTest >> createPillarFile1 [
	| pillarFile |
	pillarFile := 'input1.pillar' asFileReference.
	
	pillarFile writeStreamDo: [ :stream |
		stream nextPutAll: '!!! TestFile11

+Pillar logo>figures/pillar.png|width=30+

If you don''t know ''Pillar'', its documentation is *here>https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/PillarChap/Pillar.html*


!!! TestFile12

Hey you ...

!!! TestFile13

The book is generated directly in HTML and LaTeX with the command ==make book==



You can compile just one chapter with the command ==make book-result/chapterPathAndName.format==
For example, for the first chapter in LaTeX: ==make book-result/Chapters/Chapter1/chapter1.tex==


!!! TestFile14
What are you thinking about !!!??

!!! TestFile15
Where are you !!
'
		 ]
]

{ #category : #initialization }
PRHtmlDocumentTest >> setUp [
	self createPillarFile1.
	self createMustacheTemplateFile.
	self createPillarConfFile.
	project := PRProject new baseDirectory: FileSystem workingDirectory.
	"htmlDocument := PRHtmlDocument new.
	projectDirectory := '../test' asFileReference.
	projectDirectory ensureDeleteAll.
	projectDirectory ensureCreateDirectory.
	project := PRProject on: projectDirectory."
	
]

{ #category : #running }
PRHtmlDocumentTest >> tearDown [
	(FileSystem workingDirectory / 'input1.pillar') delete.
	(FileSystem workingDirectory / 'pillar.conf') delete.
	(FileSystem workingDirectory / 'html.mustache') delete
]

{ #category : #tests }
PRHtmlDocumentTest >> testMustacheTemplateWithHtmlOutputContainsTocAnnotation [
	| htmlDocument |
	htmlDocument := PRHtmlDocument new project: project; file: 'input1.pillar' asFileReference readStream; target: PRHtmlOutput new.
	
	self assert: ((htmlDocument getMustacheTemplateValuesFromDocument: (PRPillarParser parse: 'input1.pillar' asFileReference contents)) includesKey: #toc)
]

{ #category : #tests }
PRHtmlDocumentTest >> testMustacheTemplateWithPdfOutputDontContainsTocAnnotation [
	| htmlDocument |
	htmlDocument := PRPDFDocument new project: project; file: 'input1.pillar' asFileReference readStream; target: PRPdfOutput new.
	
	self deny: ((htmlDocument getMustacheTemplateValuesFromDocument: (PRPillarParser parse: 'input1.pillar' asFileReference contents)) includesKey: #toc)
]
