tests
testMustacheTemplateValuesDontContainsToc
	| htmlDocument |
	htmlDocument := PRPDFDocument new project: project; file: 'input1.pillar' asFileReference readStream; target: PRPdfOutput new.
	
	self deny: ((htmlDocument getMustacheTemplateValuesFromDocument: (PRPillarParser parse: 'input1.pillar' asFileReference readStream)) includesKey: #tableOfContents)