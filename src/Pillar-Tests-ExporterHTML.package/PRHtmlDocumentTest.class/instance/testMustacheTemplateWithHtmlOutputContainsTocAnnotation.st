tests
testMustacheTemplateWithHtmlOutputContainsTocAnnotation
	| htmlDocument |
	htmlDocument := PRHtmlDocument new project: project; file: 'input1.pillar' asFileReference readStream; target: PRHtmlOutput new.
	
	self assert: ((htmlDocument getMustacheTemplateValuesFromDocument: (PRPillarParser parse: 'input1.pillar' asFileReference contents)) includesKey: #toc)