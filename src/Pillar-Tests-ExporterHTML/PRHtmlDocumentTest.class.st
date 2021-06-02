Class {
	#name : #PRHtmlDocumentTest,
	#superclass : #TestCase,
	#instVars : [
		'project',
		'memoryFileSystem'
	],
	#category : #'Pillar-Tests-ExporterHTML'
}

{ #category : #tests }
PRHtmlDocumentTest >> createMustacheTemplateFile [
	| mustacheTemplate |
	mustacheTemplate := memoryFileSystem / 'html.mustache'.
	
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
	pillarConf := memoryFileSystem / 'pillar.conf'.
	
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
	pillarFile := memoryFileSystem / 'input1.pillar'.
	
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
	super setUp.
	memoryFileSystem := FileSystem memory.
	self createPillarFile1.
	self createMustacheTemplateFile.
	self createPillarConfFile.
	project := PRProject new baseDirectory: memoryFileSystem workingDirectory

]

{ #category : #tests }
PRHtmlDocumentTest >> testMustacheTemplateWithHtmlOutputContainsTocAnnotation [
	
	| htmlDocument |
	htmlDocument := PRHtmlDocument new 
		project: project; 
		file: (memoryFileSystem / 'input1.pillar'); 
		target: PRHtmlOutput new.
	self assert: ((htmlDocument getMustacheTemplateValuesFromDocument: (PRPillarParser parse: (memoryFileSystem / 'input1.pillar') contents)) includesKey: #toc)
]

{ #category : #tests }
PRHtmlDocumentTest >> testMustacheTemplateWithPdfOutputDontContainsTocAnnotation [
	| htmlDocument |
	htmlDocument := PRPDFDocument new project: project; 
		file: memoryFileSystem / 'input1.pillar'; 
		target: PRPdfOutput new.
	
	self deny: ((htmlDocument getMustacheTemplateValuesFromDocument: (PRPillarParser parse: (memoryFileSystem / 'input1.pillar') contents)) includesKey: #toc)
]
