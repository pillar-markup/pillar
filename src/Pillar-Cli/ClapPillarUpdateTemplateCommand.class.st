"
I am a command line handler to **update the template of the current project**.
I overwrite the current template in the support folder.
I assume that the support folder is read only and the user did not modify it.

**Example of usage:** `./pillar updateTemplate book`
"
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
