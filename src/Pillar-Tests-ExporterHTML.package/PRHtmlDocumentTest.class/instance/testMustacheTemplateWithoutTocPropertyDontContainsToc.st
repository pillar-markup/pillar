tests
testMustacheTemplateWithoutTocPropertyDontContainsToc
	| htmlDocument |
	htmlDocument := PRHtmlDocument new project: project; file: 'input1.pillar' asFileReference readStream; target: PRHtmlOutput new.
	
	self deny: ((htmlDocument getMustacheTemplateValuesFromDocument: (PRPillarParser parse: 'input1.pillar' asFileReference readStream)) includesKey: #tableOfContents)