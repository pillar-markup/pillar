Class {
	#name : #ClapPillarUpdateTemplateCommand,
	#superclass : #ClapPillarCommand,
	#category : #'Pillar-Cli-Clap'
}

{ #category : #accessing }
ClapPillarUpdateTemplateCommand class >> commandName [
	^ 'updateTemplate'
]

{ #category : #'command line' }
ClapPillarUpdateTemplateCommand class >> commandSpecification [
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
ClapPillarUpdateTemplateCommand >> execute [
	self project installTemplateNamed: self requestedTemplate
]

{ #category : #activation }
ClapPillarUpdateTemplateCommand >> requestedTemplate [
	 ^ (arguments at: #requestedTemplate) value: self
]
