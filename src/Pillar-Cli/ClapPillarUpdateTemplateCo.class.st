Class {
	#name : #ClapPillarUpdateTemplateCo,
	#superclass : #ClapApplication,
	#instVars : [
		'project'
	],
	#category : #'Pillar-Cli-Clap'
}

{ #category : #'command line' }
ClapPillarUpdateTemplateCo class >> commandSpecification [
	<commandline>
	^ (ClapCommand id: #updateTemplate)
		description: 'Update a given template';
		add: ClapFlag forHelp;
		add: ((ClapPositional id: #requestedTemplate )
			description: 'Template you want to update');		
		meaning:
			[ :args |
			args at: #helpFlag ifPresent: [ :help | help value; exitSuccess ].
			(self with: args) execute ]
	
]

{ #category : #execution }
ClapPillarUpdateTemplateCo >> execute [
	self project installTemplateNamed: self requestedTemplate
]

{ #category : #accessing }
ClapPillarUpdateTemplateCo >> project [
	^ project ifNil: [ project := PRProject on: FileSystem workingDirectory  ]
]

{ #category : #activation }
ClapPillarUpdateTemplateCo >> requestedTemplate [
	 ^ (arguments at: #requestedTemplate) value: self
]
