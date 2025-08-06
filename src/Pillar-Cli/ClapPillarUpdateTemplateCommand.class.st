"
I am a command line handler to **update the template of the current project**.
I overwrite the current template in the support folder.
I assume that the support folder is read only and the user did not modify it.

**Example of usage:** `./pillar updateTemplate book`
"
Class {
	#name : 'ClapPillarUpdateTemplateCommand',
	#superclass : 'ClapPillarCommand',
	#category : 'Pillar-Cli-Clap',
	#package : 'Pillar-Cli',
	#tag : 'Clap'
}

{ #category : 'accessing' }
ClapPillarUpdateTemplateCommand class >> commandName [
	^ 'updateTemplate'
]

{ #category : 'command line' }
ClapPillarUpdateTemplateCommand class >> commandSpecification [
	<commandline>
	^ (ClapCommandSpec id: self commandName asSymbol)
		description: 'Reinstall the given template';
		commandClass: self;
		addHelp;
		addPositional: #requestedTemplate description: 'Template you want to update';
		yourself
	
]

{ #category : 'execution' }
ClapPillarUpdateTemplateCommand >> execute [
	self project installTemplateNamed: self requestedTemplate
]

{ #category : 'activation' }
ClapPillarUpdateTemplateCommand >> requestedTemplate [
	 ^ self positional: #requestedTemplate
]
