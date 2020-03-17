Class {
	#name : #ClapPillarUpdateTemplateCo,
	#superclass : #ClapPillarCommand,
	#instVars : [
		'project'
	],
	#category : #'Pillar-Cli-Clap'
}

{ #category : #accessing }
ClapPillarUpdateTemplateCo class >> commandName [
	^ 'updateTemplate'
]

{ #category : #'command line' }
ClapPillarUpdateTemplateCo class >> commandSpecification [
	<commandline>
	^ (ClapCommand id: self commandName asSymbol)
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
	^ super project
]

{ #category : #activation }
ClapPillarUpdateTemplateCo >> requestedTemplate [
	 ^ (arguments at: #requestedTemplate) value: self
]
